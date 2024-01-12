<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8" />
    <!-- SEO Meta Tags -->
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <!-- Viewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#ffffff" />
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>@yield('title', 'Trang chủ') - {{ config('app.name', 'Laravel') }}</title>
    <!-- Favicon and Touch Icons -->
    <link rel="icon" sizes="180x180" href="{{ asset('img/apple-touch-icon.png') }}" />
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('img/icon-32x32.png') }}" />
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('img/icon-16x16.png') }}" />
    <!-- CSS -->
    <link rel="stylesheet" media="screen" href="{{ asset('vendor/simplebar/simplebar.min.css') }}" />
    <link rel="stylesheet" media="screen" href="{{ asset('vendor/tiny-slider/tiny-slider.css') }}" />
    <link rel="stylesheet" media="screen" href="{{ asset('vendor/nouislider/nouislider.min.css') }}" />
    <link rel="stylesheet" media="screen" href="{{ asset('vendor/drift-zoom/drift-basic.min.css') }}" />
    <link rel="stylesheet" media="screen" href="{{ asset('vendor/lightgallery/lightgallery-bundle.min.css') }}" />
    <link rel="stylesheet" media="screen" href="{{ asset('css/theme.min.css') }}" />

    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/tiny-slider.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/style.css') }}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <!-- Login -->
    <link rel="stylesheet" href="{{ asset('vendor/all.min.css') }}" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/sb-admin-2.min.css') }}">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=Nunito" rel="stylesheet">


</head>

<body>

    <body class="handheld-toolbar-enabled">
        <main class="page-wrapper">
            <header class="shadow-sm">
                <div class="navbar-sticky bg-light">
                    <div class="navbar navbar-expand-lg navbar-light">
                        <div class="container">
                            <a class="navbar-brand d-none d-sm-block flex-shrink-0" href="{{ route('frontend.home') }}">
                                <img src="{{ asset('img/logo_dark.png') }}" width="142" />
                            </a>
                            <a class="navbar-brand d-sm-none flex-shrink-0 me-2" href="{{ route('frontend.home') }}">
                                <img src="{{ asset('img/logo-icon.png') }}" width="74" />
                            </a>
                            <div class="input-group d-none d-lg-flex mx-4">
                                <form action="{{ route('frontend.timkiem') }}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <input class="form-control rounded-end pe-5" type="text" name="tukhoa" placeholder="Tìm kiếm với tên sản phẩm" />
                                    <button type="submit" name="timkiem" class="btn position-absolute top-50 end-0 translate-middle-y text-muted fs-base me-3 "><i class="ci-search"></i></button>

                                </form>
                            </div>
                            <div class="navbar-toolbar d-flex flex-shrink-0 align-items-center">
                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <a class="navbar-tool navbar-stuck-toggler" href="#menu">
                                    <span class="navbar-tool-tooltip">Mở rộng menu</span>
                                    <div class="navbar-tool-icon-box"><i class="navbar-tool-icon ci-menu"></i></div>
                                </a>
                                @guest
                                <a class="navbar-tool ms-1 ms-lg-0 me-n1 me-lg-2" href="{{ route('user.dangnhap') }}">
                                    <div class="navbar-tool-icon-box"><i class="navbar-tool-icon ci-user"></i></div>
                                    <div class="navbar-tool-text ms-n3"><small>Xin chào</small>Khách hàng</div>
                                </a>
                                @else
                                @if(Auth::check())
                                @if(Auth::user()->role == 'admin')
                                <a class="navbar-tool ms-1 ms-lg-0 me-n1 me-lg-2" href="{{ route('admin.home') }}">
                                    <div class="navbar-tool-icon-box"><i class="navbar-tool-icon ci-user"></i></div>
                                    <div class="navbar-tool-text ms-n3"><small>Xin chào</small>{{ Auth::user()->name }}</div>
                                </a>
                                @else
                                <a class="navbar-tool ms-1 ms-lg-0 me-n1 me-lg-2" href="{{ route('user.home') }}">
                                    <div class="navbar-tool-icon-box"><i class="navbar-tool-icon ci-user"></i></div>
                                    <div class="navbar-tool-text ms-n3"><small>Xin chào</small>{{ Auth::user()->name }}</div>
                                </a>
                                @endif
                                @endif
                                @endguest
                                <div class="navbar-tool ms-3">
                                    <a class="navbar-tool-icon-box bg-secondary" href="{{ route('frontend.giohang') }}">
                                        <span class="navbar-tool-label">{{ Cart::count() ?? 0 }}</span><i class="navbar-tool-icon ci-cart"></i>
                                    </a>
                                    <a class="navbar-tool-text" href="{{ route('frontend.giohang') }}"><small>Giỏ hàng</small>{{ Cart::priceTotal() }}đ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="navbar navbar-expand-lg navbar-light navbar-stuck-menu mt-n2 pt-0 pb-2">
                        <div class="container">
                            <div class="collapse navbar-collapse" id="navbarCollapse">
                                <div class="input-group d-lg-none my-3">
                                    <i class="ci-search position-absolute top-50 start-0 translate-middle-y text-muted fs-base ms-3"></i>
                                    <input class="form-control rounded-start" type="text" placeholder="Tìm kiếm" />
                                </div>
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link ps-lg-0" href="{{ route('frontend.home') }}">
                                            <i class="ci-home me-2"></i>Trang chủ
                                        </a>
                                    </li>
                                </ul>
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="{{ route('frontend.sanpham') }}" data-bs-toggle="dropdown" data-bs-auto-close="outside"><i class="ci-gift me-2"></i>Sản phẩm</a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="{{ route('frontend.sanpham.phanloai', ['tenloai_slug' => 'nam']) }}">Nước hoa cho Nam</a></li>
                                            <li><a class="dropdown-item" href="{{ route('frontend.sanpham.phanloai', ['tenloai_slug' => 'nu']) }}">Nước hoa cho Nữ</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{{ route('frontend.baiviet') }}"><i class="ci-globe me-2"></i>Tin tức</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{{ route('frontend.tuyendung') }}"><i class="ci-loudspeaker me-2"></i>Tuyển dụng</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{{ route('frontend.lienhe') }}"><i class="ci-support me-2"></i>Liên hệ</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            @yield('content')
        </main>

        <footer class="footer bg-dark">
            <div class="pt-5 bg-darker">
                <div class="container">
                    <div class="row pb-2">
                        <div class="col-md-6 text-center text-md-start mb-4">
                            <div class="text-nowrap mb-4">
                                <a class="d-inline-block align-middle mt-n1 me-3" href="#"><img class="d-block" src="{{ asset('img/footer-logo-light.png') }}" width="117" /></a>
                            </div>
                        </div>
                        <div class="col-md-6 text-center text-md-end mb-4">
                            <div class="mb-3">
                                <a class="btn-social bs-light bs-twitter ms-2 mb-2" href="https://twitter.com/"><i class="ci-twitter"></i></a>
                                <a class="btn-social bs-light bs-facebook ms-2 mb-2" href="https://www.facebook.com/"><i class="ci-facebook"></i></a>
                                <a class="btn-social bs-light bs-instagram ms-2 mb-2" href="https://www.instagram.com/"><i class="ci-instagram"></i></a>
                                <a class="btn-social bs-light bs-pinterest ms-2 mb-2" href="https://www.pinterest.com/"><i class="ci-pinterest"></i></a>
                                <a class="btn-social bs-light bs-youtube ms-2 mb-2" href="https://www.youtube.com/"><i class="ci-youtube"></i></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <p class="mb-4 text-white">With an intuitive and user-friendly interface, our website offers
                                    a seamless online shopping experience, ensuring convenience for those passionate about
                                    the world of fragrances.</p>
                            </div>
                            <div class="col-lg-2">
                            </div>

                            <div class="col-lg-6">
                                <div class="row links-wrap">
                                    <div class="widget widget-links widget-light">
                                        <ul class="widget-list d-flex flex-wrap justify-content-center justify-content-md-start">
                                            <li class="widget-list-item me-4"><a class="widget-list-link" href="{{ route('frontend.home') }}">Trang chủ</a></li>
                                            <li class="widget-list-item me-4"><a class="widget-list-link" href="{{ route('frontend.sanpham') }}">Sản phẩm</a></li>
                                            <li class="widget-list-item me-4"><a class="widget-list-link" href="{{ route('frontend.baiviet') }}">Tin
                                                    tức</a></li>
                                            <li class="widget-list-item me-4"><a class="widget-list-link" href="{{ route('frontend.tuyendung') }}">Tuyển
                                                    dụng</a></li>
                                            <li class="widget-list-item me-4"><a class="widget-list-link" href="{{ route('frontend.lienhe') }}">Liên
                                                    hệ</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="pb-4 fs-xs text-light opacity-50 text-center text-md-start">Bản quyền &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script> bởi Tôi.
                    </div>
                </div>
            </div>
        </footer>

        <a class="btn-scroll-top" href="#top" data-scroll>
            <span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span>
            <i class="btn-scroll-top-icon ci-arrow-up"></i>
        </a>
        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        @yield('javascript')

        <script src="{{ asset('vendor/bootstrap/bootstrap.bundle.min.js') }}"></script>
        <script src="{{ asset('vendor/simplebar/simplebar.min.js') }}"></script>
        <script src="{{ asset('vendor/tiny-slider/tiny-slider.js') }}"></script>
        <script src="{{ asset('vendor/smooth-scroll/smooth-scroll.polyfills.min.js') }}"></script>
        <script src="{{ asset('vendor/nouislider/nouislider.min.js') }}"></script>
        <script src="{{ asset('vendor/imagesloaded/imagesloaded.pkgd.min.js') }}"></script>
        <script src="{{ asset('vendor/shufflejs/shuffle.min.js') }}"></script>
        <script src="{{ asset('vendor/lightgallery/lightgallery.min.js') }}"></script>
        <script src="{{ asset('vendor/lightgallery/plugins/fullscreen/lg-fullscreen.min.js') }}"></script>
        <script src="{{ asset('vendor/lightgallery/plugins/zoom/lg-zoom.min.js') }}"></script>
        <script src="{{ asset('vendor/lightgallery/plugins/video/lg-video.min.js') }}"></script>
        <script src="{{ asset('vendor/drift-zoom/Drift.min.js') }}"></script>
        <script src="{{ asset('js/theme.min.js') }}"></script>

        <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
        <script src="{{ asset('js/tiny-slider.js') }}"></script>
        <script src="{{ asset('js/custom.js') }}"></script>

        <!-- Login -->
        <script src="{{ asset('js/sb-admin-2.min.js') }}"></script>
        <script src="{{ asset('vendor/jquery-easing/jquery.easing.min.js') }}"></script>
        <script src="{{ asset('vendor/jquery/jquery.min.js') }}"></script>
    </body>

</html>