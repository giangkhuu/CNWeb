<?php

namespace App\Http\Controllers;

use App\Models\DonHang_ChiTiet;
use Illuminate\Http\Request;

class DonHangChiTietController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function getDanhSach()
    {
        $donhang_chitiet = DonHang_ChiTiet::all();
        return view('donhang_chitiet.danhsach', compact('donhang_chitiet'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(DonHang_ChiTiet $donHang_ChiTiet)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(DonHang_ChiTiet $donHang_ChiTiet)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, DonHang_ChiTiet $donHang_ChiTiet)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(DonHang_ChiTiet $donHang_ChiTiet)
    {
        //
    }
}
