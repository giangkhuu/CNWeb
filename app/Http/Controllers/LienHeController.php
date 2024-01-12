<?php

namespace App\Http\Controllers;

use App\Models\LienHe;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class LienHeController extends Controller
{
    public function getDanhSach()
    {
        $lienhe = LienHe::all();
        return view('admin.lienhe.danhsach', compact('lienhe'));
    }

    public function getThem()
    {
        return view('frontend.lienhe.them');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function postThem(Request $request)
    {

       
        $request->validate([
            'ten' => ['required', 'string', 'max:191'],
            'email' => ['required', 'string', 'max:255'],
            'sdt' => ['required', 'string', 'max:20'],
            'chude' => ['required', 'string', 'max:255'],
        ]);
        $orm = new LienHe();
        $orm->ten = $request->ten;
        $orm->email = $request->email;
        $orm->sdt = $request->sdt;
        $orm->chude = $request->chude;
        $orm->noidung = $request->noidung;
        $orm->save();
        return redirect()->route('frontend.lienhe');
    }

    public function getXem($id)
    {
        $lienhe = LienHe::find($id);
        return view('admin.lienhe.xem', compact('lienhe'));
    }

    public function getXoa($id)
    {
        $orm = LienHe::find($id);
        $orm->delete();
        return redirect()->route('admin.lienhe');
    }
}
