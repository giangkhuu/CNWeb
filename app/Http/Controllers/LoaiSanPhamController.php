<?php

namespace App\Http\Controllers;

use App\Models\LoaiSanPham;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class LoaiSanPhamController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     */
    public function getDanhSach()
    {
        $loaisanpham = LoaiSanPham::all();
        return view('admin.loaisanpham.danhsach', compact('loaisanpham'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function getThem()
    {
        return view('admin.loaisanpham.them');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function postThem(Request $request)
    {

        $request->validate([
            'tenloai' => ['required', 'max:255', 'unique:loaisanpham'],
        ]);

        $orm = new LoaiSanPham();
        $orm->tenloai = $request->tenloai;
        $orm->tenloai_slug = Str::slug($request->tenloai, '-');
        $orm->save();
        return redirect()->route('admin.loaisanpham');
    }

    /**
     * Display the specified resource.
     */
    public function getSua($id)
    {
        $loaisanpham = LoaiSanPham::find($id);
        return view('admin.loaisanpham.sua', compact('loaisanpham'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function postSua(Request $request, $id)
    {
        $request->validate([
            'tenloai' => ['required', 'max:255', 'unique:loaisanpham,tenloai,' .$id],
        ]);
        $orm = LoaiSanPham::find($id);
        $orm->tenloai = $request->tenloai;
        $orm->tenloai_slug = Str::slug($request->tenloai, '-');
        $orm->save();
        return redirect()->route('admin.loaisanpham');
    }

    /**
     * Update the specified resource in storage.
     */
    public function getXoa($id)
    {
        $orm = LoaiSanPham::find($id);
        $orm->delete();
        return redirect()->route('admin.loaisanpham');
    }

    /**
     * Remove the specified resource from storage.
     */
}
