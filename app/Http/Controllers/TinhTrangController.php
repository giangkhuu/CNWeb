<?php

namespace App\Http\Controllers;

use App\Models\TinhTrang;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class TinhTrangController extends Controller
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
        $tinhtrang = TinhTrang::all();
        return view('admin.tinhtrang.danhsach', compact('tinhtrang'));
    }

    public function getThem()
    {
        return view('admin.tinhtrang.them');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function postThem(Request $request)
    {

        $request->validate([
            'tinhtrang' => ['required', 'max:255', 'unique:tinhtrang'],
        ]);

        $orm = new TinhTrang();
        $orm->tinhtrang = $request->tinhtrang;
        $orm->save();
        return redirect()->route('admin.tinhtrang');
    }

    /**
     * Display the specified resource.
     */
    public function getSua($id)
    {
        $tinhtrang = TinhTrang::find($id);
        return view('admin.tinhtrang.sua', compact('tinhtrang'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function postSua(Request $request, $id)
    {
        $request->validate([
            'tinhtrang' => ['required', 'max:255', 'unique:tinhtrang,tinhtrang' . $id],
        ]);
        $orm = TinhTrang::find($id);
        $orm->tinhtrang = $request->tinhtrang;
        $orm->save();
        return redirect()->route('admin.tinhtrang');
    }

    /**
     * Update the specified resource in storage.
     */
    public function getXoa($id)
    {
        $orm = TinhTrang::find($id);
        $orm->delete();
        return redirect()->route('admin.tinhtrang');
    }

    /**
     * Remove the specified resource from storage.
     */
}
