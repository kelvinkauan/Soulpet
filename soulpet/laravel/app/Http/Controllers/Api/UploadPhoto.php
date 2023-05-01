<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use File;
use Storage;
use DB;
use Hash;
use Auth;
use Image;

use App\Models\User;

class UploadPhoto extends Controller
{

     public function createImagem(Request $request) {
        $name = time();
        $name_img = 'img-'.$name.'.png';
        
        // return $name_img.'aaaaaa';

        // Faz o upload:
        $upload = Storage::disk('uploads')->put('avatar',$request->image);
        // rename file
        $image1 = $request->file('image')->storeAs('',$name_img,'avatar');       
            
        // Verifica se NÃO deu certo o upload (Redireciona de volta)
        if ( !$upload ) {
            return ['img_name' => 'Falha ao fazer upload'];
        }

         return ['img_name' => $name_img];
    }

    public function gravarFotoAvatar(Request $request,$user_id) {
    
             // Verifica se informou o arquivo e se é válido
        if ($request->hasFile('image') && $request->file('image')->isValid()) {
             
            // Define um aleatório para o arquivo baseado no timestamps atual
            $name = uniqid(date('HisYmd'));
     
            // Recupera a extensão do arquivo
            $extension = $request->image->extension();
     
            // Define finalmente o nome
            $nameFile = "{$name}.{$extension}";
     
            // Faz o upload:
            $upload = $request->image->storeAs('', $nameFile,'avatar');
            // Se tiver funcionado o arquivo foi armazenado em storage/app/public/categories/nomedinamicoarquivo.extensao
     
            // Verifica se NÃO deu certo o upload (Redireciona de volta)
             if($upload){
                 User::where('id', $user_id)->update(['avatar' => $nameFile]);
            }


            // Verifica se NÃO deu certo o upload (Redireciona de volta)
            if ( !$upload ) {
                return ['img_name' => 'Falha ao fazer upload'];
            }

             return ['img_name' => $nameFile];

     
            }
            return ['img_name' => 'Falha ao fazer upload'];

    }



}
