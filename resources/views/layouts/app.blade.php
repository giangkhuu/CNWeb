<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>{{ config('app.name', 'Laravel') }}</title>

    <link rel="icon" sizes="180x180" href="{{ asset('img/apple-touch-icon.png') }}" />
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('img/icon-32x32.png') }}" />
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('img/icon-16x16.png') }}" />

    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />
    @yield('css')
    <link rel="stylesheet" href="{{ asset('css/site.css') }}" />
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=Nunito" rel="stylesheet">


</head>

<body>
    <div class="container-fluid">
        <nav class="navbar navbar-expand-md navbar-light shadow-sm bg-info">
            <div class="container-fluid">
                <a class="navbar-brand" href="{{ route('admin.home') }}">
                    <i class="fa-light fa-cart-shopping"></i> {{ config('app.name', 'Laravel') }}
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">

                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left side of Navbar -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('admin.loaisanpham') }}"><i class="fa-light fa-fw bi-diagram-2"></i> Loại sản phẩm</a>
                        </li>

                        <li class="nav-item">

                            <a class="nav-link" href="{{ route('admin.hangsanxuat') }}"><i class="fa-light fa-fw bi-building"></i> Hãng sản xuất</a>
                        </li>

                        <li class="nav-item">

                            <a class="nav-link" href="{{ route('admin.sanpham') }}"><i class="fa-light fa-fw bi-box"></i> Sản phẩm</a>
                        </li>

                        <li class="nav-item">

                            <a class="nav-link" href="{{ route('admin.tinhtrang') }}"><i class="fa-light fa-fw bi-list-check"></i> Tình trạng</a>
                        </li>

                        <li class="nav-item">

                            <a class="nav-link" href="{{ route('admin.donhang') }}"><i class="fa-light fa-fw  bi-file-minus"></i> Đơn hàng</a>
                        </li>

                        <li class="nav-item">

                            <a class="nav-link" href="{{ route('admin.nguoidung') }}"><i class="fa-light fa-fw bi-person"></i> Tài khoản</a>
                        </li>
                        <li class="nav-item">

                            <a class="nav-link" href="{{ route('admin.lienhe') }}"><i class="fa-light fa-fw bi-telephone"></i> Liên hệ</a>
                        </li>
                        <li class="nav-item">

                            <a class="nav-link" href="{{ route('frontend.home') }}"><i class="fa-light fa-fw bi-bag"></i> Trang bán hàng</a>
                        </li>
                    </ul>

                    <!-- Right side of Navbar -->

                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        @guest
                        @if (Route::has('login'))
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('login') }}"><i class="fa-light fa-fw fa-sign-in-alt"></i> Đăng nhập</a>
                        </li>
                        @endif

                        @if (Route::has('register'))

                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('register') }}"><i class="fa-light fa-user-plus"></i> Đăng ký</a>
                        </li>
                        @endif
                        @else
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#nguoidung" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-light fa-user-circle"></i> {{ Auth::user()->name }}
                            </a>

                            <div class="dropdown-menu">

                                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                    <i class="fa-light fa-fw fa-sign-out-alt"></i> Đăng xuất
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="post" class="d-none">

                                    @csrf
                                </form>
                            </div>
                        </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>
        <main class="pt-3">
            @yield('content')
        </main>
        <hr class="shadow-sm" />
        <footer>Bản quyền &copy; {{ date('Y') }} bởi {{ config('app.name', 'Laravel') }}.</footer>

    </div>
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    @yield('javascript')
</body>

</html>