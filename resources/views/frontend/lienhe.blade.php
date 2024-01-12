@extends('layouts.frontend')
@section('title', 'Tuyển dụng')
@section('content')
<div class="bg-secondary py-4">
    <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
        <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-start">
                    <li class="breadcrumb-item">
                        <a class="text-nowrap" href="{{ route('frontend.home') }}"><i class="ci-home"></i>Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap active" aria-current="page">Liên hệ</li>
                </ol>
            </nav>
        </div>
        <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 mb-0">Liên hệ</h1>
        </div>
    </div>
</div>

<section class="container-fluid pt-grid-gutter">
    <div class="row">
        <div class="col-xl-3 col-sm-6 mb-grid-gutter">
            <a class="card h-100" href="#map" data-scroll>
                <div class="card-body text-center">
                    <i class="ci-location h3 mt-2 mb-4 text-primary"></i>
                    <h3 class="h6 mb-2">Địa chỉ cửa hàng</h3>
                    <p class="fs-sm text-muted">Vĩnh Trạch, Thoại Sơn An Giang</p>
                    <div class="fs-sm text-primary">Xem bản đồ<i class="ci-arrow-right align-middle ms-1"></i></div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-sm-6 mb-grid-gutter">
            <div class="card h-100">
                <div class="card-body text-center">
                    <i class="ci-time h3 mt-2 mb-4 text-primary"></i>
                    <h3 class="h6 mb-3">Giờ làm việc</h3>
                    <ul class="list-unstyled fs-sm text-muted mb-0">
                        <li>Thứ 2 - Thứ 6: 08:00 AM - 08:00 PM</li>
                        <li class="mb-0">Thứ 7 - Chủ Nhật: 08:00 AM - 22:00 PM</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-grid-gutter">
            <div class="card h-100">
                <div class="card-body text-center">
                    <i class="ci-phone h3 mt-2 mb-4 text-primary"></i>
                    <h3 class="h6 mb-3">Điện thoại</h3>
                    <ul class="list-unstyled fs-sm mb-0">
                        <li>
                            <span class="text-muted me-1">Bán hàng:</span>
                            <a class="nav-link-style" href="tel:+84123456888">+84 0374 133 897</a>
                        </li>
                        <li class="mb-0">
                            <span class="text-muted me-1">Hỗ trợ kỹ thuật:</span>
                            <a class="nav-link-style" href="tel:+84123456999">+84 03741 133 897</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-grid-gutter">
            <div class="card h-100">
                <div class="card-body text-center">
                    <i class="ci-mail h3 mt-2 mb-4 text-primary"></i>
                    <h3 class="h6 mb-3">Địa chỉ email</h3>
                    <ul class="list-unstyled fs-sm mb-0">
                        <li>
                            <span class="text-muted me-1">Bán hàng:</span>
                            <a class="nav-link-style" href="mailto:customer@perfumesshop.vn">customer@perfumesshop.vn</a>
                        </li>
                        <li class="mb-0">
                            <span class="text-muted me-1">Hỗ trợ kỹ thuật:</span>
                            <a class="nav-link-style" href="mailto:support@perfumesshop.vn">support@perfumesshop.vn</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="container-fluid px-0" id="map">
    <div class="row g-0">
        <div class="col-lg-6 iframe-full-height-wrap">
            <iframe class="iframe-full-height" width="600" height="250" src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7849.889712883709!2d105.33095029999996!3d10.346294500000011!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1704635221809!5m2!1svi!2s"></iframe>
        </div>
        <div class="col-lg-6 px-4 px-xl-5 py-5 border-top">
            <h2 class="h4 mb-4">Để lại lời nhắn</h2>
            <form action="{{ route('frontend.lienhe.them') }}" method="post">
                @csrf
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label class="form-label" for="ten">Họ và tên:&nbsp;<span class="text-danger">*</span></label>
                        <input class="form-control @error('ten') is-invalid @enderror" type="text" id="ten" name="ten" placeholder="Khưu Hoàng Giang"  value="{{ old('ten') }}" required />
                        @error('ten')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>
                    <div class="col-sm-6">
                        <label class="form-label" for="email">Địa chỉ email:&nbsp;<span class="text-danger">*</span></label>
                        <input class="form-control @error('email') is-invalid @enderror" type="email" id="email" name="email" placeholder="giangkhuu3897@email.com" value="{{ old('email') }}" required />
                        @error('email')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>
                    <div class="col-sm-6">
                        <label class="form-label" for="sdt">Điện thoại:&nbsp;<span class="text-danger">*</span></label>
                        <input class="form-control @error('sdt') is-invalid @enderror" type="text" id="sdt" name="sdt" placeholder="0374 133 897" value="{{ old('sdt') }}" required />
                        @error('sdt')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>
                    <div class="col-sm-6">
                        <label class="form-label" for="chude">Chủ đề:&nbsp;<span class="text-danger">*</label>
                        <input class="form-control @error('chude') is-invalid @enderror" type="text" id="chude" name="chude" placeholder="Cung cấp tiêu đề ngắn gọn"  value="{{ old('chude') }}" required />
                        @error('chude')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>
                    <div class="col-12">
                        <label class="form-label" for="noidung">Nội dung tin nhắn:&nbsp;<span class="text-danger">*</span></label>
                        <textarea class="form-control @error('noidung') is-invalid @enderror" id="noidung" name="noidung" rows="6" placeholder="Hãy mô tả chi tiết yêu cầu của bạn">{{ old('noidung') }}</textarea>
                    </div>
                    @error('noidung')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                    
                </div>
                <button class="btn btn-primary mt-4" type="submit">Gởi tin nhắn</button>
            </form>
        </div>
    </div>
</div>
@endsection
@section('javascript')
<script src="{{ asset('vendor/ckeditor5/ckeditor.js') }}"></script>

<script>
    ClassicEditor.create(document.querySelector('#noidung'), {
        licenseKey: '',
    }).then(editor => {
        window.editor = editor;
    }).catch(error => {
        console.error(error);
    });
</script>
@endsection