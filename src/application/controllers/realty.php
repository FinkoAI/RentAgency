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

        $data['content']='text text text text text text';
        $data['title']= 'Список недвижимости';
        $this->_render($data);
	}

    public function view($id)
    {
        $id = (int)$id;

        $data['content']='text text text text text text';
        $data['title']= "Просмотр записи $id";

        $this->_render($data);
    }
}

