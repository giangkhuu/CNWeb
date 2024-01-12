@extends('layouts.frontend')
@section('title', 'Giỏ hàng')
@section('content')
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
                    <li class="breadcrumb-item text-nowrap active" aria-current="page">Giỏ hàng</li>
                </ol>
            </nav>
        </div>
        <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 text-light mb-0">Giỏ hàng</h1>
        </div>
    </div>
</div>
<div class="untree_co-section before-footer-section">
    <div class="container">
        <div class="row mb-5">
            <form class="col-md-12" action="{{ route('frontend.giohang.capnhat') }}" method="post">
            @csrf
                <div class="site-blocks-table">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="product-thumbnail">Hình ảnh</th>
                                <th class="product-name">Tên sản phẩm</th>
                                <th class="product-price">Giá</th>
                                <th class="product-quantity">Số lượng</th>
                                <th class="product-total">Thành tiền</th>
                                <th class="product-remove">Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach(Cart::content() as $value)
                            <tr>
                                <td class="product-thumbnail">
                                    <img src="{{ env('APP_URL') . '/storage/app/' . $value->options->image }}" alt="Image" class="img-fluid">
                                </td>
                                <td class="product-name">
                                    <h2 class="h5 text-black">{{ $value->name }}</h2>
                                </td>
                                <td>{{ number_format($value->price, 0, ',', '.') }}<small>VNĐ</small></td>
                                <td class="product-quantity">
                                    <div class="input-group mb-3 d-flex justify-content-center align-items-center quantity-container" style="max-width: 120px;">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-outline-black decrease" type="button"><a href="{{ route('frontend.giohang.giam', ['row_id' => $value->rowId]) }}"><i class="ci-arrow-left-circle"></i></a></button>
                                        </div>
                                        <input type="text" class="form-control text-center quantity-amount" id="qty" name="qty[{{ $value->rowId }}]" min="1" value="{{ $value->qty }}" />
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-black increase" type="button"><a href="{{ route('frontend.giohang.tang', ['row_id' => $value->rowId]) }}"><i class="ci-arrow-right-circle"></i></a></button>
                                        </div>
                                    </div>
                                </td>
                                <td>{{ number_format($value->price * $value->qty, 0, ',', '.') }}<small>VNĐ</small></td>
                                <td><a class="btn btn-link px-0 text-danger" href="{{ route('frontend.giohang.xoa', ['row_id' => $value->rowId]) }}">

                                        <i class="ci-close-circle me-2"></i><span class="fs-sm">Xóa</span>
                                    </a></td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="row mb-5">
                    <div class="col-md-6 mb-3 mb-md-0">
                        <button class="btn btn-black btn-sm btn-block bg-info" type="submit">Cập nhật giỏ hàng</button>
                    </div>
                    <div class="col-md-6">
                    <a class="btn btn-outline-black btn-sm btn-block bg-info" href="{{ route('frontend.home') }}">
                    Tiếp tục mua hàng
                </a>
                    </div>
                </div>
                <div class="row">
                    <!-- khung sang trái -->
                </div>
            </div>
            <div class="col-md-6 pl-5 ">
                <div class="row justify-content-end">
                    <div class="col-md-7 bg-light">
                        <div class="row">
                            <div class="col-md-12 text-right border-bottom mb-5">
                                <h3 class="text-black h4 text-uppercase">Hóa Đơn</h3>
                            </div>
                        </div>
                        <div class="row mb-5">
                            <div class="col-md-6">
                                <span class="text-black">Tổng tiền</span>
                            </div>
                            <div class="col-md-6 text-right">
                                <strong class="text-black">{{ Cart::priceTotal() }}<small> VNĐ</small></strong>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-black btn-lg py-3 btn-block"> <a class="btn btn-primary btn-shadow d-block w-100 mt-4" href="{{ route('user.dathang') }}">
                                        <i class="ci-card fs-lg me-2"></i>Thanh toán
                                    </a></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection