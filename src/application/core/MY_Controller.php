<?php
class MY_Controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
    }

    final public function _render($data = array(), $view = 'content')
    {
        $data['alert']=$this->flashdata();

        $this->load->vars($data);

        $this->load->view('header');
        $this->load->view($view);
        $this->load->view('footer');
    }

    /**
     * Задание уведомления
     */
    final public function alert($text,$type='info'){
        // type = ok, info, err
        $this->session->set_flashdata('alert', serialize(array('text'=>$text,'type'=>$type)));
    }

    /**
     * Формирование текста уведомления
     */
    private function flashdata(){
        $alert=$this->session->flashdata('alert');
        if($alert){
            $alert = unserialize($alert);
            if('ok'==$alert['type']) $class='alert-success'; elseif('err'==$alert['type']) $class='alert-error'; else $class='alert-info';
            return "<div class='alert $class'><button data-dismiss='alert' class='close' type='button'>×</button> {$alert['text']} </div>";
        }
        return '';
    }

}
