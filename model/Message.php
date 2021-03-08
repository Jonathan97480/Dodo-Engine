<?php
class Message extends Model
{
    public $table = 't_messages';


    public function getAllmessage()
    {

        $d = $this->find([
            'fields' => 'id,objet_message,date,is_read'
        ]);

        return $d;
    }

    public function deleteMessage($id)
    {

        $m = $this->readMessage($id);

        if (isset($m->error)) {

            return $m->error;
        }

        $this->delete($id);
    }

    public function postMessage($email, $obj, $content, $fullName)
    {
        $m = new stdClass();

        if (filter_var($email, FILTER_VALIDATE_EMAIL) == false) {
            $m->error[10] = 'email Invalide';
            return $m;
        }
        $this->save([
            'objet_message' => htmlspecialchars($obj),
            'email' => $email,
            'content_message' => htmlspecialchars($content),
            'full_name' => htmlspecialchars($fullName)
        ]);

        return true;
    }

    public function readMessage($id)
    {
        $m = new stdClass();
        if (is_numeric($id) == false) {
            $m->error[10] = 'id Invalide';
            return $m;
        }

        $m->message = $this->findFirst([
            'conditions' => ['id' => $id]
        ]);

        if (empty($m->message)) {
            $m->error[20] = 'Ce message n\'existe pas ';
            return $m;
        }
        $this->save([
            'id' => $id,
            'is_read' => 1
        ]);

        return $m->message;
    }

    public function getNewMessages(){

        $d = new stdClass();

        $d->info = $this->find([
            'conditions'=>['is_read'=>'0'],
            'LIMIT'=>'0,5',
            'ORDER BY'=>'id DESC'
        ]);

         $d->count = $this->countMessages();   
        
         return $d;
    }

    private function countMessages(){

       $d = $this->findCount([
            'is_read'=>'0'
        ]);

        return $d;
    }
}
