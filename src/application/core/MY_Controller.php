<?php
class MY_Controller extends CI_Controller {

    protected $alert      = '';

    protected $styles      = FALSE;
    protected $custom_css  = FALSE;
    protected $scripts     = FALSE;
    protected $custom_js   = FALSE;
    protected $title       = FALSE;
    protected $description = FALSE;
    protected $keywords    = FALSE;
    protected $content     = FALSE;

    public function __construct()
    {
        parent::__construct();
    }

    final public function _render($view = 'content', $data = array())
    {
        $data['alert']=$this->_flashdata();

        $tpl['user_id'] = 0;
        $tpl['user_level'] = 0;
        $tpl['user_name'] = 'Гость';
        if(isset($this->auth) and $user_id=$this->auth->userid()){
            $user =$this->db->from('users')->where('id',$user_id)->get()->row();
            $tpl['user_id'] = $user->id;
            $tpl['user_level'] = $user->level;
            $tpl['user_name'] = $user->username;
        }

        // ------

        $tpl['scripts'] = '';
        if($this->scripts != FALSE){
            foreach((array)$this->scripts as $val){
                $tpl['scripts'] .= "<script src='{$val}'></script>\n";
            }
        }
        $tpl['styles'] = '';
        if($this->styles != FALSE){
            foreach((array)$this->styles as $val){
                $tpl['styles'] .= "<link rel='stylesheet' href='{$val}'>\n";
            }
        }
        $tpl['custom_css'] = $this->custom_css;
        $tpl['custom_js'] = $this->custom_js;

        $tpl['title'] = $this->title;
        $tpl['description'] = $this->description;
        $tpl['keywords'] = $this->keywords;

        $tpl['content'] = $this->content;


        // Если задан content, то работаем без представления
        if($this->content !== FALSE){
            $data['content'] = $this->content;
        }

        $tpl['content'] = $this->load->view($view,$data,TRUE);

        $this->load->view('template',$tpl);
    }


    /**
     * Задание уведомления
     */
    public function _alert($text,$type='info'){
        // type = ok, info, err
        $this->session->set_flashdata('alert', serialize(array('text'=>$text,'type'=>$type)));
    }

    /**
     * Формирование текста уведомления
     */
    private function _flashdata(){
        $alert=$this->session->flashdata('alert');
        if($alert){
            $alert = unserialize($alert);
            if('ok'==$alert['type']) $class='alert-success'; elseif('err'==$alert['type']) $class='alert-error'; else $class='alert-info';
            return "<div class='alert $class'><button data-dismiss='alert' class='close' type='button'>×</button> {$alert['text']} </div>";
        }
        return '';
    }

}
