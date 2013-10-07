<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Realty extends MY_Controller {

	public function index()
	{

        /*
        // Пример без выноса кода в отдельное представление
        $out="";
        $lines=$this->db->from('realty')->where('status',1)->get()->result();
        foreach ($lines as $line) {
            $out .= "<p>      <pre>".print_r($line,1)."</pre>      </p>";
        }
        $data['content']=$out;
        */


        $this->content ='text text text text text text';
        $this->title= 'Список недвижимости';
        $this->_render();
	}

    public function view($id)
    {
        $id = (int)$id;


        $this->content ='text text text text text text';
        $this->title= "Просмотр записи $id";
        $this->_render();
    }
}

