@extends('layouts.frontend')
@section('title', 'Trang chủ')
@section('content')
<section class="container mt-4 mb-grid-gutter">
    <div class="bg-faded-info rounded-3 py-4">
        <div class="row align-items-center">
            <div class="col-md-5">
                <div class="px-4 pe-sm-0 ps-sm-5">
                    <span class="badge bg-danger">Khuyến mãi đặc biệt</span>
                    <h3 class="mt-4 mb-1 text-body fw-light">Sản phẩm mới</h3>
                    <h2 class="mb-1">Nước Hoa Bản Mới</h2>
                    <p class="h5 text-body fw-light">Số lượng sản phẩm có hạn!</p>
                    <a class="btn btn-accent" href="#">Xem chi tiết<i class="ci-arrow-right fs-ms ms-1"></i></a>
                </div>
            </div>
            <div class="col-md-7"><img src="{{ asset('img/eau-de-parfum.jpg') }}" /></div>
        </div>
    </div>
</section>
<section class="container">
    <div class="tns-carousel border-end">
        <div class="tns-carousel-inner" data-carousel-options="{ &quot;nav&quot;: false, &quot;controls&quot;: false, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 4000, &quot;loop&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;360&quot;:{&quot;items&quot;:2},&quot;600&quot;:{&quot;items&quot;:3},&quot;991&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}} }">
            @foreach($hangsanxuat as $hangsanxuat)
            <div>
                <a class="d-block bg-white border py-4 py-sm-5 px-2" href="{{ route('frontend.sanpham.phanhang', ['tenhang_slug' => $hangsanxuat->tenhang_slug ]) }}">
                    <img class="d-block mx-auto" src="{{ env('APP_URL') . '/storage/app/' . $hangsanxuat->hinhanh }}" style="width:165px; height: 83px;" />
                </a>
            </div>
            @endforeach
        </div>
    </div>
</section>
@foreach($loaisanpham as $loaisanpham)
<section class="container pt-3 pb-5">
    <div class="untree_co-section product-section">
        <div class="d-flex flex-wrap justify-content-between align-items-center pt-1 border-bottom pb-4 mb-4">
            <h2 class="h3 mb-0 pt-3 me-2">{{ $loaisanpham->tenloai }}</h2>
            <div class="pt-3">
                <a class="btn btn-outline-accent btn-sm" href="{{ route('frontend.sanpham.phanloai', ['tenloai_slug' => $loaisanpham->tenloai_slug]) }}">
                    Xem tất cả<i class="ci-arrow-right ms-1 me-n1"></i>
                </a>
            </div>
        </div>
        <div class="container">
            <div class="row">
                @foreach($loaisanpham->SanPham->take(8) as $sanpham)
                <div class="col-12 col-md-4 col-lg-3 mb-5">
                    <a class="product-item" href="{{ route('frontend.sanpham.chitiet', ['tenloai_slug' => $loaisanpham->tenloai_slug, 'tensanpham_slug' => $sanpham->tensanpham_slug . '-' . $sanpham->id . '.html']) }}">
                        <img src="{{ env('APP_URL') . '/storage/app/' . $sanpham->hinhanh }}" class="img-fluid product-thumbnail">
                        <h3 class="product-title">{{ $sanpham->tensanpham }}</h3>
                        <strong class="product-price">{{ number_format($sanpham->dongia, 0, ',', '.') }} VNĐ</strong>


                        <a class="btn btn-primary btn-sm d-block w-100 mb-2" href="{{ route('frontend.giohang.them', ['tensanpham_slug' => $sanpham->tensanpham_slug]) }}">
                            <span class="icon-cross">
                                <img src="{{ asset('img/cross.svg') }}" class="img-fluid">
                            </span>
                        </a>
                    </a>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</section>
@endforeach
@endsection