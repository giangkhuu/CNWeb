<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class HinhAnh extends Model
{
    use HasFactory;
    protected $table = 'hinhanh';

    protected $fillable = [
        'sanpham_id',
        'hinhanhmota',
    ];

    public function SanPham(): BelongsTo
    {
        return $this->belongsTo(SanPham::class, 'sanpham_id', 'id');
    }
}
