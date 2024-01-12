@extends('layouts.frontend')
@section('title', 'Tin Tức')
@section('content')
<div class="bg-dark pt-4">
    <div class="container pt-2 pb-3 pt-lg-3 pb-lg-4">
        <div class="d-lg-flex justify-content-between pb-3">
            <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                        <li class="breadcrumb-item">
                            <a class="text-nowrap" href="{{ route('frontend.home') }}"><i class="ci-home"></i>Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item text-nowrap active" aria-current="page">Tin tức</li>
                    </ol>
                </nav>
            </div>
            <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                <h1 class="h3 text-light mb-0">Tin tức</h1>
            </div>
        </div>
    </div>
</div>
<div class="card">
    <div class="card-body">
        @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
        @endif
        Trang tin tức đang trong quá trình cập nhật sẽ sớm được cập nhật.
    </div>
</div>
@endsection