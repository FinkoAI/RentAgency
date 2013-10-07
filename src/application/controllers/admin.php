<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends MY_Controller {

	public function index()
	{
        $this->content ='text text text text text text';
        $this->title= 'Панель администратора';
        $this->_render();
	}
}

