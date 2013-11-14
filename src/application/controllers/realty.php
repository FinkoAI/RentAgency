<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Realty extends MY_Controller {

	// public function index()
	// {


 //        // Пример без выноса кода в отдельное представление
 //        $out="";
 //        $lines=$this->db->from('realty')->where('status',1)->get()->result();
 //        foreach ($lines as $line) {
 //            $out .= "<p>      <pre>".print_r($line,1)."</pre>      </p>";
 //        }
 //        $data['content']=$out;



 //        $this->content ='text text text text text text';
 //        $this->title= 'Список недвижимости';
 //        $this->_render();
	// }

    // public function view($id){
    //     $id = (int)$id;


    //     $this->content ='text text text text text text';
    //     $this->title= "Просмотр записи $id";
    //     $this->_render();
    // }


/*
id_realty   int(11)
user_id     int(11)
publish     tinyint(1)
type        enum('продажа','сдача')
room_count  int(11)
address     varchar(255)
district    varchar(255)
geo_lon     double
geo_lat     double
date_pub    datetime
date_end    datetime
phones      varchar(255)
description text
price       int(11)
floor_count int(11)
floor       int(11)
material    enum('кирпич','панель','дерево')
balcony     tinyint(1)
elevator    tinyint(1)
garbage     tinyint(1)
furniture   tinyint(1)
photo       tinyint(1)

*/

    public function add(){
        if ( isset($_POST['content'])){

            $data['user_id'] = 1;
            $data['publish'] = 0;
            $data['type'] = $_POST['type'];
            $data['room_count'] = $_POST['room_count'];
            $data['address'] = $_POST['address'];
            $data['district'] = $_POST['district'];
            $data['geo_lon'] = $_POST['geo_lon'];
            $data['geo_lat'] = $_POST['geo_lat'];
            $data['date_pub'] = date('Y-m-d H:i:s');
            $data['date_end'] = date('Y-m-d H:i:s',strtotime("+1 month"));
            $data['phones'] = $_POST['phones'];
            $data['description'] = $_POST['description'];
            $data['price'] = $_POST['price'];
            $data['floor_count'] = $_POST['floor_count'];
            $data['material'] = $_POST['material'];
            $data['balcony'] = $_POST['balcony'];
            $data['elevator'] = $_POST['elevator'];
            $data['furniture'] = $_POST['furniture'];

            $data['photo'] = $_POST['photo']; //1 если фото загружено


            $this->db->insert('realtys', $data);

            $this->_alert("Объявление добавленно. После прохождения модерации оно будет отображено на главной странице",'ok');
            redirect('/realty/');

            exit;
        }


        $this->content ='вывод формы';
        $this->title= "Добавить объявление";
        $this->_render();
    }


    public function list(){
        $lines=$this->db->from('realtys')->where('publish',1)->or_where('user_id',$this->user_id)->get()->result();

        $this->content = '<pre>'.print_r($lines,1);

        $this->title= "Список объявлений";
        $this->_render();
    }
}

