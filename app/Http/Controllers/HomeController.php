<?php

namespace App\Http\Controllers;

use App\Models\HangSanXuat;
use Illuminate\Http\Request;
use App\Models\NguoiDung;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Gloudemans\Shoppingcart\Facades\Cart;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Str;
use App\Models\LoaiSanPham;
use App\Models\SanPham;
use Exception;

class HomeController extends Controller
{

    public function getHome()
    {
        // Bổ sung code tại đây
        $loaisanpham = LoaiSanPham::all();
        $hangsanxuat = HangSanXuat::all();
        return view('frontend.home', compact('loaisanpham', 'hangsanxuat'));
    }

    public function getSanPham($tenloai_slug = '')
    {
        // Bổ sung code tại đây
        if (empty($tenloai_slug)) {
            $title = 'Loại Sản Phẩm';
            $sanpham = SanPham::orderBy('created_at', 'desc')
                ->paginate(20);
        } else {
            $loaisanpham = LoaiSanPham::where('tenloai_slug', $tenloai_slug)
                ->firstOrFail();
            $title = $loaisanpham->tenloai;
            $sanpham = SanPham::where('loaisanpham_id', $loaisanpham->id)
                ->orderBy('created_at', 'desc')
                ->paginate(20);
        }
        return view('frontend.sanpham', compact('title', 'sanpham'));
    }
    public function getPhanHang($tenhang_slug = '')
    {
        // Bổ sung code tại đây
        if (empty($tenhang_slug)) {
            $title = 'Hãng Sản Xuất';
            $sanpham = SanPham::orderBy('created_at', 'desc')
                ->paginate(20);
        } else {
            $hangsanxuat = HangSanXuat::where('tenhang_slug', $tenhang_slug)
                ->firstOrFail();
            $title = $hangsanxuat->tenhang;
            $sanpham = SanPham::where('hangsanxuat_id', $hangsanxuat->id)
                ->orderBy('created_at', 'desc')
                ->paginate(20);
        }
        return view('frontend.sanpham', compact('title', 'sanpham'));
    }

    public function postTimKiem(Request $request)
    {
        $tukhoa = $request->tukhoa;
        // Bổ sung code tại đây
        if (empty($tenloai_slug)) {
            $title = 'Bài viết';
            $sanpham = SanPham::orderBy('created_at', 'desc')
                ->paginate(20);
        } else {
            $loaisanpham = LoaiSanPham::where('tenloai_slug', $tenloai_slug)
                ->firstOrFail();
            $title = $loaisanpham->tenloai;
            $sanpham = SanPham::where('loaisanpham_id', $loaisanpham->id)
                ->orderBy('created_at', 'desc')
                ->paginate(20);
        }
        $timkiem = SanPham::where('tensanpham', 'like', '%' . $tukhoa . '%')
            ->get();
        if (!$tukhoa) abort(404);

        return view('frontend.timkiem', compact('title', 'sanpham', 'timkiem'));
    }


    public function getSanPham_ChiTiet($tenloai_slug = '', $tensanpham_slug = '')
    {
        // Bổ sung code tại đây
        $loaisanpham = LoaiSanPham::where('tenloai_slug', $tenloai_slug)
            ->firstOrFail();
        $tensanpham_id = explode('.', $tensanpham_slug);
        $tensanpham = explode('-', $tensanpham_id[0]);
        $sanpham_id = $tensanpham[count($tensanpham) - 1];
        $sanpham = SanPham::where('id', $sanpham_id)
            ->firstOrFail();
        if (!$sanpham) abort(404);
        $sanphamcungloai = SanPham::where('loaisanpham_id', $sanpham->loaisanpham_id)
            ->where('id', '!=', $sanpham_id)
            ->orderBy('created_at', 'desc')
            ->take(6)
            ->get();
        return view('frontend.sanpham_chitiet', compact('sanpham', 'loaisanpham', 'sanphamcungloai'));
    }

    public function getBaiViet($tenchude_slug = '')
    {
        // Bổ sung code tại đây
        return view('frontend.baiviet');
    }

    public function getBaiViet_ChiTiet($tenchude_slug = '', $tieude_slug = '')

    {
        // Bổ sung code tại đây
        return view('frontend.baiviet_chitiet');
    }

    public function getGioHang()
    {
        if (Cart::count() > 0)
            return view('frontend.giohang');
        else
            return view('frontend.giohangrong');
    }

    public function getGioHang_Them($tensanpham_slug = '')
    {
        $sanpham = SanPham::where('tensanpham_slug', $tensanpham_slug)->first();
        Cart::add([
            'id' => $sanpham->id,
            'name' => $sanpham->tensanpham,
            'price' => $sanpham->dongia,
            'qty' => 1, //số lượng 
            'weight' => 0, // cân nặng 
            'options' => [
                'image' => $sanpham->hinhanh
            ]
        ]);
        return redirect()->route('frontend.home');
    }

    public function getGioHang_Xoa($row_id)
    {
        Cart::remove($row_id);
        return redirect()->route('frontend.giohang');
    }

    public function getGioHang_Giam($row_id)
    {
        $row = Cart::get($row_id);
        // Nếu số lượng là 1 thì không giảm được nữa
        if ($row->qty > 1) {
            Cart::update($row_id, $row->qty - 1);
        }
        return redirect()->route('frontend.giohang');
    }

    public function getGioHang_Tang($row_id)
    {
        $row = Cart::get($row_id);
        // Không được tăng vượt quá 10 sản phẩm
        if ($row->qty < 10) {
            Cart::update($row_id, $row->qty + 1);
        }
        return redirect()->route('frontend.giohang');
    }

    public function postGioHang_CapNhat(Request $request)
    {
        foreach ($request->qty as $row_id => $quantity) {
            if ($quantity <= 0)
                Cart::update($row_id, 1);
            else if ($quantity > 10)
                Cart::update($row_id, 10);
            else
                Cart::update($row_id, $quantity);
        }

        return redirect()->route('frontend.giohang');
    }
    public function getTuyenDung()
    {
        return view('frontend.tuyendung');
    }

    public function getLienHe()
    {
        return view('frontend.lienhe');
    }

    // Trang đăng ký dành cho khách hàng
    public function getDangKy()
    {
        return view('user.dangky');
    }

    // Trang đăng nhập dành cho khách hàng
    public function getDangNhap()
    {
        return view('user.dangnhap');
    }
    public function getQuenMatKhau()
    {
        return view('user.quenmatkhau');
    }

    public function getGoogleLogin()
    {
        return Socialite::driver('google')->redirect();
    }
    public function getGoogleCallback()
    {
        try {
            $user = Socialite::driver('google')
                /* ->setHttpClient(new \GuzzleHttp\Client(['verify' => false]))
                ->stateless() */
                ->user();
        } catch (Exception $e) {
            return redirect()->route('user.dangnhap')->with('warning', 'Lỗi xác thực. Xin vui lòng thử lại!');
        }
        $existingUser = NguoiDung::where('email', $user->email)->first();
        if ($existingUser) {
            // Nếu người dùng đã tồn tại thì đăng nhập
            Auth::login($existingUser, true);
            return redirect()->route('user.home');
        } else {
            // Nếu chưa tồn tại người dùng thì thêm mới
            $newUser = NguoiDung::create([
                'name' => $user->name,
                'email' => $user->email,
                'username' => Str::before($user->email, '@'), 'password' => Hash::make('Nhutren123'), // Gán mật khẩu tự do
            ]);
            // Sau đó đăng nhập
            Auth::login($newUser, true);
            return redirect()->route('user.home');
        }
    }

}
