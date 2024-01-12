@extends('layouts.frontend')
@section('title', 'Đăng nhập')
@section('content')
<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                <form method="post" action="{{ route('login') }}" class="needs-validation" novalidate>
                                    @csrf
                                    @if($errors->has('email') || $errors->has('username'))
                                    <div class="alert alert-danger fs-base" role="alert">
                                        <i class="ci-close-circle me-2"></i>{{ empty($errors->first('email')) ? $errors->first('username') : $errors->first('email') }}
                                    </div>
                                    @enderror
                                    <div class="input-group mb-3">
                                        <i class="ci-user position-absolute top-50 translate-middle-y text-muted fs-base ms-3"></i>
                                        <input type="text" class="form-control rounded-start {{ ($errors->has('email') || $errors->has('username')) ? 'is-invalid' : '' }}" id="email" name="email" value="{{ old('email') }}" placeholder="Email hoặc Tên đăng nhập" required />
                                    </div>
                                    <div class="input-group mb-3">
                                        <i class="ci-locked position-absolute top-50 translate-middle-y text-muted fs-base ms-3"></i>
                                        <div class="password-toggle w-100">
                                            <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password" placeholder="Mật khẩu" required />
                                            <label class="password-toggle-btn" aria-label="Hiện/Ẩn mật khẩu">
                                                <input class="password-toggle-check" type="checkbox" />
                                                <span class="password-toggle-indicator"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }} />
                                            <label class="form-check-label" for="remember">Duy trì đăng nhập</label>
                                        </div>
                                    </div>
                                    <button class="btn btn-danger btn-user btn-block" type="submit"><i class="ci-sign-in me-2 ms-n21"></i>Đăng nhập</button>
                                    <hr>
                                    <a href="{{ route('google.login') }}" class="btn btn-info btn-google btn-user btn-block" data-bs-toggle="tooltip"><i class="fab fa-google fa-fw"></i> Đăng nhập với Google</a>
                                </form>
                                <hr>
                                <div class="text-center">
                                    @if (Route::has('password.request'))
                                    <a class="small" href="{{ route('password.request') }}">Quên mật khẩu?</a>
                                    @endif
                                </div>
                                <div class="text-center">
                                    @if (Route::has('register'))
                                    <a class="small" href="{{ route('user.dangky') }}">Đăng ký</a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>
@endsection