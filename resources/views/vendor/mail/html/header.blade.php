@props(['url'])
<tr>
    <td class="header">
        <a href="{{ $url }}" style="display: inline-block;">
            <img src="{{ asset('img/apple-touch-icon.png') }}" class="logo" />
            <br />
            {{ $slot }}
        </a>
    </td>
</tr>