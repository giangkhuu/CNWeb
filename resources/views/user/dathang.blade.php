@extends('layouts.frontend')
@section('title', 'Đặt hàng')
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
                        <a href="{{ route('frontend.giohang') }}">Giỏ hàng</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap active" aria-current="page">Đặt hàng</li>
                </ol>
            </nav>
        </div>
        <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 text-light mb-0">Đặt hàng</h1>
        </div>
    </div>
</div>

<div class="untree_co-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mb-5 mb-md-0">
                <h2 class="h3 mb-3 text-black">Thông tin giao hàng</h2>
                <form method="post" action="{{ route('user.dathang') }}" class="needs-validation" novalidate>
                    @csrf
                    <div class="p-3 p-lg-5 border bg-white">
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label class="text-black" for="HoVaTen">Khách hàng <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" id="HoVaTen" value="{{ Auth::user()->name ?? '' }}" disabled />
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label class="text-black" for="dienthoaigiaohang">Điện thoại giao hàng <span class="text-danger">*</span></label>
                                <input class="form-control @error('dienthoaigiaohang') is-invalid @enderror" type="text" id="dienthoaigiaohang" name="dienthoaigiaohang" required />
                                @error('dienthoaigiaohang')
                                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label class="text-black" for="diachigiaohang">Địa chỉ giao hàng <span class="text-danger">*</span></label>
                                <input class="form-control @error('diachigiaohang') is-invalid @enderror" type="text" id="diachigiaohang" name="diachigiaohang" required />
                                @error('diachigiaohang')
                                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                                @enderror
                            </div>
                        </div>
                        <h6 class="mb-3 py-3 border-bottom">Thông tin xuất hóa đơn</h6>

                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" checked id="same-address">
                            <label class="form-check-label" for="same-address">Tương tự thông tin giao hàng</label>
                        </div>

                        <input type="submit" id="submit-form" hidden />
                    </div>
                </form>
            </div>
            <div class="col-md-6">

                <div class="row mb-5">
                    <div class="col-md-12">
                        <h2 class="h3 mb-3 text-black">Sản phẩm bạn đặt</h2>
                        <div class="p-3 p-lg-5 border bg-white">

                            <table class="table site-block-order-table mb-5">

                                <thead>
                                    <th>Sản Phẩm</th>
                                    <th>Giá</th>
                                </thead>
                                <tbody>
                                    @foreach(Cart::content() as $value)
                                    <tr>
                                        <td>{{ $value->name }} <strong class="mx-2">x</strong> {{ $value->qty }}</td>
                                        <td>{{ number_format($value->price * $value->qty, 0, ',', '.') }}<small> VNĐ</small></td>
                                    </tr>
                                    @endforeach
                                    <tr>
                                        <td class="text-black font-weight-bold"><strong>Tổng tiền</strong></td>
                                        <td class="text-black font-weight-bold"><strong>{{ Cart::priceTotal() }}</strong></td>
                                    </tr>
                                </tbody>

                            </table>
                            <div class="form-group">
                                <label for="submit-form" class="btn btn-primary d-block w-100">
                                    <span class="d-none d-sm-inline">Hoàn tất đặt hàng</span>
                                    <span class="d-inline d-sm-none">Hoàn tất</span>
                                    <i class="ci-arrow-right mt-sm-0 ms-1"></i>
                                </label>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


@endsection