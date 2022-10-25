<?php

use Illuminate\Support\Facades\Route;

/*
  |--------------------------------------------------------------------------
  | Web Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register web routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | contains the "web" middleware group. Now create something great!
  |
 */


Route::get('setlocale/{locale}', function ($lang) {
    \Session::put('locale', $lang);
    return redirect()->back();
})->name('setlocale');

// Frontend Routes
Route::get('/', function () {
    return redirect('/admin/login');
})->name('home');

Route::group(['middleware' => 'language'], function () {

    // Admin Routes
    Route::prefix('admin')->group(function () {

        Route::get('/login', [App\Http\Controllers\Auth\LoginController::class, 'login'])->name('login');
        Route::post('/login', [App\Http\Controllers\Auth\LoginController::class, 'login_go'])->name('login_go');
        Route::get('/logout', [App\Http\Controllers\Auth\LoginController::class, 'logout'])->name('logout');

        Route::get('forget-password', [App\Http\Controllers\Auth\ForgotPasswordController::class, 'showForgetPasswordForm'])->name('forget.password.get');
        Route::post('forget-password', [App\Http\Controllers\Auth\ForgotPasswordController::class, 'submitForgetPasswordForm'])->name('forget.password.post');

        Route::get('reset-password/{token}', [App\Http\Controllers\Auth\ForgotPasswordController::class, 'showResetPasswordForm'])->name('reset.password.get');
        Route::post('reset-password', [App\Http\Controllers\Auth\ForgotPasswordController::class, 'submitResetPasswordForm'])->name('reset.password.post');

        // Admin Authenticated Routes
        Route::group(['middleware' => ['auth']], function () {

            Route::get('/dashboard', [App\Http\Controllers\Admin\DashboardController::class, 'dashboard'])->name('dashboard');

            // Profile
            Route::get('/profile', [App\Http\Controllers\Admin\UserController::class, 'profile'])->name('profile');
            Route::post('/profile/update/{id}', [App\Http\Controllers\Admin\UserController::class, 'profile_update'])->name('profile.update');

            // User
            Route::prefix('users')->group(function () {
                Route::get('/index', [App\Http\Controllers\Admin\UserController::class, 'index'])->name('users.index');
                Route::get('/create', [App\Http\Controllers\Admin\UserController::class, 'create'])->name('users.create');
                Route::post('/store', [App\Http\Controllers\Admin\UserController::class, 'store'])->name('users.store');
                Route::get('/edit/{id}', [App\Http\Controllers\Admin\UserController::class, 'edit'])->name('users.edit');
                Route::post('/update/{id}', [App\Http\Controllers\Admin\UserController::class, 'update'])->name('users.update');
                Route::post('/destroy', [App\Http\Controllers\Admin\UserController::class, 'destroy'])->name('users.destroy');
                Route::get('/status_update', [App\Http\Controllers\Admin\UserController::class, 'status_update'])->name('users.status_update');
            });

            // Role
            Route::prefix('roles')->group(function () {
                Route::get('/index', [App\Http\Controllers\Admin\RoleController::class, 'index'])->name('roles.index');
                Route::get('/create', [App\Http\Controllers\Admin\RoleController::class, 'create'])->name('roles.create');
                Route::post('/store', [App\Http\Controllers\Admin\RoleController::class, 'store'])->name('roles.store');
                Route::get('/edit/{id}', [App\Http\Controllers\Admin\RoleController::class, 'edit'])->name('roles.edit');
                Route::post('/update/{id}', [App\Http\Controllers\Admin\RoleController::class, 'update'])->name('roles.update');
                Route::post('/destroy', [App\Http\Controllers\Admin\RoleController::class, 'destroy'])->name('roles.destroy');
            });

            // Permission
            Route::prefix('permissions')->group(function () {
                Route::get('/index', [App\Http\Controllers\Admin\PermissionController::class, 'index'])->name('permissions.index');
                Route::get('/create', [App\Http\Controllers\Admin\PermissionController::class, 'create'])->name('permissions.create');
                Route::post('/store', [App\Http\Controllers\Admin\PermissionController::class, 'store'])->name('permissions.store');
                Route::get('/edit/{id}', [App\Http\Controllers\Admin\PermissionController::class, 'edit'])->name('permissions.edit');
                Route::post('/update/{id}', [App\Http\Controllers\Admin\PermissionController::class, 'update'])->name('permissions.update');
                Route::post('/destroy', [App\Http\Controllers\Admin\PermissionController::class, 'destroy'])->name('permissions.destroy');
            });

        });
    });
});
