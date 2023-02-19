<?php

namespace App\Http\Controllers;

use Symfony\Component\HttpFoundation\BinaryFileResponse;

class StorageController extends Controller
{
    public function storage($folder, $subFolder, $filename = null): BinaryFileResponse
    {
        if(empty($filename)){
            return response()->file(storage_path('app/public/' . $folder . '/' . $subFolder));
        }
        return response()->file(storage_path('app/public/' . $folder . '/' . $subFolder . '/'. $filename));
    }
}
