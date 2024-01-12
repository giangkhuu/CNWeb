@extends('layouts.frontend')
@section('title', 'Sản phẩm')
@section('content')
<!-- Page Title-->
<div class="page-title-overlap bg-dark pt-4">
    <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
        <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                    <li class="breadcrumb-item">
                        <a class="text-nowrap" href="{{ route('frontend.home') }}"><i class="ci-home"></i>Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap">
                        <a href="{{ route('frontend.sanpham') }}">Sản phẩm</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap active" aria-current="page">Chi tiết</li>
                </ol>
            </nav>
        </div>
        <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 text-light mb-0">{{ $sanpham->tensanpham }}</h1>
        </div>
    </div>
</div>
<div class="container">
    <div class="bg-light shadow-lg rounded-3 px-4 py-3 mb-5">
        <div class="px-lg-3">
            <div class="row">
                <div class="col-lg-7 pe-lg-0 pt-lg-4">
                    <div class="product-gallery">
                        <div class="product-gallery-preview order-sm-2">
                            <div class="product-gallery-preview-item active" id="first">
                                <img class="image-zoom" src="{{ env('APP_URL') . '/storage/app/' . $sanpham->hinhanh }}" data-zoom="{{ env('APP_URL') . '/storage/app/' . $sanpham->hinhanh }}" width="300" />
                                <div class="image-zoom-pane"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 pt-4 pt-lg-0">
                    <div class="product-details ms-auto pb-3">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                        </div>
                        <div class="mb-3">
                            <h1>{{ $sanpham->tensanpham }}</h1>
                        </div>
                        <div class="mb-3">
                            <span class="h3 fw-normal text-accent me-1">
                                <h3 class="text-dark">Giá: {{ number_format($sanpham->dongia, 0, ',', '.') }} <small>VNĐ</small></h3>
                            </span>
                        </div>
                        <div class="mb-3 d-flex align-items-center">
                            <a class="btn btn-primary btn-sm d-block w-100 mb-2" href="{{ route('frontend.giohang.them', ['tensanpham_slug' => $sanpham->tensanpham_slug]) }}">
                                <i class="ci-cart fs-sm me-1"></i>Thêm vào giỏ hàng
                            </a>
                        </div>

                        <div class="accordion mb-4" id="productPanels">
                            <div class="accordion-item">
                                <h3 class="accordion-header">
                                    <a class="accordion-button" href="#productInfo" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="productInfo">
                                        <i class="ci-announcement text-muted fs-lg align-middle mt-n1 me-2"></i>Thông tin cơ bản
                                    </a>
                                </h3>
                                <div class="accordion-collapse collapse show" id="productInfo" data-bs-parent="#productPanels">
                                    <div class="accordion-body">
                                        <h5>Tên: {{ $sanpham->tensanpham }}</h5>
                                        <h5>Giá: {{ number_format($sanpham->dongia, 0, ',', '.') }} <small>VNĐ</small></h5>
                                        <h5>Kho: {{ $sanpham->soluong }}</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row align-items-center py-md-3">
        <div class="col-12 py-4">
            <h2 class="h3 mb-4 pb-2">Giới thiệu chi tiết sản phẩm</h2>
            <p class="text-muted pb-2" style="text-align:justify">{!! $sanpham->motasanpham !!}</p>
        </div>
    </div>
    <div class="row align-items-center py-md-3">
        <div class="col-12 py-4">
            <h2 class="h3 mb-4 pb-2">Sản phẩm liên quan</h2>
            <div class="tns-carousel">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 2, &quot;controls&quot;: false, &quot;autoHeight&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 20},&quot;900&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 20}, &quot;1100&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 30}}}">
                    @foreach($sanphamcungloai as $sanpham)
                    <article>
                        <a class="blog-entry-thumb mb-3" href="{{ route('frontend.sanpham.chitiet', ['tenloai_slug' => $loaisanpham->tenloai_slug, 'tensanpham_slug' => $sanpham->tensanpham_slug . '-' . $sanpham->id . '.html']) }}">
                            <img src="{{ env('APP_URL') . '/storage/app/' . $sanpham->hinhanh }}" />
                        </a>
                        <div class="d-flex align-items-center fs-sm mb-2">
                            <span class="text-accent">{{ number_format($sanpham->dongia, 0, ',', '.') }}<small>đ</small></span>
                        </div>
                        <h3 class="h6 blog-entry-title">
                            <a href="{{ route('frontend.sanpham.chitiet', ['tenloai_slug' => $loaisanpham->tenloai_slug, 'tensanpham_slug' => $sanpham->tensanpham_slug . '-' . $sanpham->id . '.html']) }}">
                                {{ $sanpham->tensanpham }}
                            </a>
                        </h3>
                    </article>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection