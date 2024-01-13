<?php

namespace App\Http\Controllers;

use App\Models\SanPham;
use App\Models\LoaiSanPham;
use App\Models\HangSanXuat;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use App\Imports\SanPhamImport;
use App\Exports\SanPhamExport;
use App\Models\HinhAnh;
use Maatwebsite\Excel\Facades\Excel;

class SanPhamController extends Controller
{
    public function  __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     */
    public function getDanhSach()
    {
        $sanpham = SanPham::paginate(20);
        return view('admin.sanpham.danhsach', compact('sanpham'));
    }
    /**
     * Show the form for creating a new resource.
     */
    public function getThem()
    {
        $loaisanpham = LoaiSanPham::all();
        $hangsanxuat = HangSanXuat::all();
        return view('admin.sanpham.them', compact('loaisanpham', 'hangsanxuat'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function postThem(Request $request)
    {
        // Kiểm tra
        $request->validate([
            'loaisanpham_id' => ['required'],
            'hangsanxuat_id' => ['required'],
            'tensanpham' => ['required', 'string', 'max:191', 'unique:sanpham'],
            'soluong' => ['required', 'numeric'],
            'dongia' => ['required', 'numeric'],
            'hinhanh' => ['nullable', 'image', 'max:2048'],
            'hinhanhmota.*' => ['nullable', 'image', 'max:2048'],
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Tạo thư mục nếu chưa có
            $lsp = LoaiSanPham::find($request->loaisanpham_id);
            File::isDirectory($lsp->tenloai_slug) or Storage::makeDirectory($lsp->tenloai_slug, 0775);

            // Xác định tên tập tin
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tensanpham, '-') . '.' . $extension;
            // Upload vào thư mục và trả về đường dẫn
            $path = Storage::putFileAs($lsp->tenloai_slug, $request->file('hinhanh'), $filename);
        }
        $orm = new SanPham();
        $orm->loaisanpham_id = $request->loaisanpham_id;
        $orm->hangsanxuat_id = $request->hangsanxuat_id;
        $orm->tensanpham = $request->tensanpham;
        $orm->tensanpham_slug = Str::slug($request->tensanpham, '-');
        $orm->soluong = $request->soluong;
        $orm->dongia = $request->dongia;
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->motasanpham = $request->motasanpham;
        $orm->save();
        $pathmota = '';
        $index = 1;
        if ($request->hasFile('hinhanhmota')) {
            foreach ($request->file('hinhanhmota') as $hinhanhmota) {
                // Tạo thư mục nếu chưa có
                $lsp = LoaiSanPham::find($request->loaisanpham_id);
                File::isDirectory($lsp->tenloai_slug) or Storage::makeDirectory($lsp->tenloai_slug, 0775);

                // Xác định tên tập tin
                $extension = $hinhanhmota->extension();
                $filename = Str::slug($request->tensanpham, '-') . '-' . $index . '.' . $extension;

                // Upload vào thư mục và trả về đường dẫn
                $pathmota = Storage::putFileAs($lsp->tenloai_slug, $hinhanhmota, $filename);

                // Tạo mới đối tượng HinhAnh và lưu vào cơ sở dữ liệu
                $mota = new HinhAnh();
                $mota->sanpham_id = $orm->id;
                $mota->hinhanhmota = $pathmota;
                $mota->save();

                $index++;
            }
        }


        // Sau khi thêm thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.sanpham');
    }

    /**
     * Display the specified resource.
     */
    public function getSua($id)
    {
        $sanpham = SanPham::find($id);
        $dshinhanh = HinhAnh::where('sanpham_id', $sanpham->id)->get();
        $loaisanpham = LoaiSanPham::all();
        $hangsanxuat = HangSanXuat::all();
        return view('admin.sanpham.sua', compact('sanpham', 'loaisanpham', 'hangsanxuat', 'dshinhanh'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function postSua(Request $request, $id)
    {
        // Kiểm tra
        $request->validate([
            'loaisanpham_id' => ['required'],
            'hangsanxuat_id' => ['required'],
            'tensanpham' => ['required', 'string', 'max:191', 'unique:sanpham,tensanpham,' . $id],
            'soluong' => ['required', 'numeric'],
            'dongia' => ['required', 'numeric'],
            'hinhanh' => ['nullable', 'image', 'max:2048'],
            'hinhanhmota.*' => ['nullable', 'image', 'max:2048'],
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Xóa tập tin cũ
            $sp = SanPham::find($id);
            if (!empty($sp->hinhanh)) Storage::delete($sp->hinhanh);
            // Xác định tên tập tin mới
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tensanpham, '-') . '.' . $extension;
            // Upload vào thư mục và trả về đường dẫn
            $lsp = LoaiSanPham::find($request->loaisanpham_id);

            $path = Storage::putFileAs($lsp->tenloai_slug, $request->file('hinhanh'), $filename);
        }
        $orm = SanPham::find($id);
        $orm->loaisanpham_id = $request->loaisanpham_id;
        $orm->hangsanxuat_id = $request->hangsanxuat_id;
        $orm->tensanpham = $request->tensanpham;
        $orm->tensanpham_slug = Str::slug($request->tensanpham, '-');
        $orm->soluong = $request->soluong;
        $orm->dongia = $request->dongia;
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->motasanpham = $request->motasanpham;
        $orm->save();
        $motaList = HinhAnh::where('sanpham_id', $orm->id)->get();
        foreach ($motaList as $mota) {
            if (!empty($mota->hinhanhmota)) {
                Storage::delete($mota->hinhanhmota);
            }
            $mota->delete(); // Xóa đối tượng hình ảnh mô tả từ cơ sở dữ liệu
        }
        $pathmota = '';
        $index = 1;
        if ($request->hasFile('hinhanhmota') && is_array($request->file('hinhanhmota'))) {
            foreach ($request->file('hinhanhmota') as $hinhanhmota) {

                $extension = $hinhanhmota->extension();
                $filename = Str::slug($request->tensanpham, '-') . '-' . $index . '.' . $extension;

                // Upload vào thư mục và trả về đường dẫn
                $lsp = LoaiSanPham::find($request->loaisanpham_id);
                $pathmota = Storage::putFileAs($lsp->tenloai_slug, $hinhanhmota, $filename);

                // Tạo mới đối tượng HinhAnh và lưu vào cơ sở dữ liệu
                $mota = new HinhAnh();
                $mota->sanpham_id = $orm->id;
                $mota->hinhanhmota = $pathmota;
                $mota->save();

                $index++;
            }
        }
        // Sau khi sửa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.sanpham');
    }

    /**
     * Update the specified resource in storage.
     */
    public function getXoa($id)
    {
        $orm = SanPham::find($id);
        $motaList = HinhAnh::where('sanpham_id', $orm->id)->get();
        $orm->delete();
        // Xóa tập tin khi xóa sản phẩm
        if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
        foreach ($motaList as $mota) {
            if (!empty($mota->hinhanhmota)) {
                Storage::delete($mota->hinhanhmota);
            }
            $mota->delete(); // Xóa đối tượng hình ảnh mô tả từ cơ sở dữ liệu
        }
        // Sau khi xóa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.sanpham');
    }

    /**
     * Remove the specified resource from storage.
     */
    // Nhập từ Excel
    public function postNhap(Request $request)
    {
        Excel::import(new SanPhamImport, $request->file('file_excel'));
        return redirect()->route('admin.sanpham');
    }
    // Xuất ra Excel
    public function getXuat()
    {
        return Excel::download(new SanPhamExport, 'danh-sach-san-pham.xlsx');
    }
}
