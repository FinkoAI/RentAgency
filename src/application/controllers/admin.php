<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends MY_Controller {

	public function index()
	{

        $data['content']='text text text text text text';
        $data['title']= 'Панель администратора';

        $this->_render($data);
	}
}

