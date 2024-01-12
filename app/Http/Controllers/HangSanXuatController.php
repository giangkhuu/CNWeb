<?php

namespace App\Http\Controllers;

use App\Exports\HangSanXuatExport;
use App\Imports\HangSanXuatImport;
use App\Models\HangSanXuat;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;

class HangSanXuatController extends Controller
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
        $hangsanxuat = HangSanXuat::all();
        return view('admin.hangsanxuat.danhsach', compact('hangsanxuat'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function getThem()
    {
        return view('admin.hangsanxuat.them');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function postThem(Request $request)
    {

        // Kiểm tra
        $request->validate([
            'tenhang' => ['required', 'string', 'max:191', 'unique:hangsanxuat'],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tenhang, '-') . '.' . $extension;
            $path = Storage::putFileAs('hang-san-xuat', $request->file('hinhanh'), $filename);
        }
        // Thêm
        $orm = new HangSanXuat();
        $orm->tenhang = $request->tenhang;
        $orm->tenhang_slug = Str::slug($request->tenhang, '-');
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->save();
        // Sau khi thêm thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.hangsanxuat');
    }

    /**
     * Display the specified resource.
     */
    public function getSua($id)
    {
        $hangsanxuat = HangSanXuat::find($id);
        return view('admin.hangsanxuat.sua', compact('hangsanxuat'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function postSua(Request $request, $id)
    {
        // Kiểm tra
        $request->validate([
            'tenhang' => ['required', 'string', 'max:191', 'unique:hangsanxuat,tenhang,' . $id],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Xóa file cũ
            $orm = HangSanXuat::find($id);
            if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
            // Upload file mới
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tenhang, '-') . '.' . $extension;

            $path = Storage::putFileAs('hang-san-xuat', $request->file('hinhanh'), $filename);
        }
        // Sửa
        $orm = HangSanXuat::find($id);
        $orm->tenhang = $request->tenhang;
        $orm->tenhang_slug = Str::slug($request->tenhang, '-');
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->save();
        // Sau khi sửa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.hangsanxuat');
    }

    /**
     * Update the specified resource in storage.
     */
    public function getXoa($id)
    {
        $orm = HangSanXuat::find($id);
        $orm->delete();
        // Xoá hình ảnh khi xóa dữ liệu
        if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
        // Sau khi xóa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.hangsanxuat');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function postNhap(Request $request)
    {
        Excel::import(new HangSanXuatImport, $request->file('file_excel'));
        return redirect()->route('admin.hangsanxuat');
    }
    // Xuất ra Excel
    public function getXuat()
    {
        return Excel::download(new HangSanXuatExport, 'danh-sach-hang-san-xuat.xlsx');
    }
}
