<?php

require_once('main.class.php');

class StaffClass extends BMISClass
{

    /*
        //authentication method for residents to enter
        public function residentlogin() {
        if(isset($_POST['residentlogin'])) {

            $username = $_POST['email'];
            $password = $_POST['password']; 
        
            $connection = $this->openConn();
            $stmt = $connection->prepare("SELECT * FROM tbl_resident WHERE email = ? AND password = ?");
            $stmt->Execute([$username, $password]);
            $user = $stmt->fetch();
            $total = $stmt->rowCount();
            
                //calls the set_userdata function 
                if($total > 0) {
                    $this->set_userdata($user);
                    header('Location: resident_homepage.php');
                }
                
                else {
                    echo '<script>alert("Email or Password is Invalid")</script>';
                }
            }
        }
        */


    //------------------------------------- CRUD FUNCTIONS FOR STAFF -----------------------------------------------

    public function create_staff()
    {

        if (isset($_POST['add_staff'])) {
            $fullname = trim($_POST['fullname']);
            $term_started = $_POST['term_started'];
            $term_ended = $_POST['term_ended'];
            $position = $_POST['position'];
            $status = $_POST['status'];

            if (!in_array($status, ['Active', 'Inactive'])) {
                echo "<script type='text/javascript'>alert('Invalid staff status');</script>";
                return;
            }

            if (!empty($term_started) && !empty($term_ended) && $term_started > $term_ended) {
                echo "<script type='text/javascript'>alert('Term Ended must be later than or equal to Term Started');</script>";
                return;
            }

            $connection = $this->openConn();
            $stmt = $connection->prepare("INSERT INTO tbl_staff (`fullname`, `term_started`, `term_ended`, `position`, `status`) VALUES (?, ?, ?, ?, ?)");

            $stmt->Execute([$fullname, $term_started, $term_ended, $position, $status]);
            $message2 = "New staff added";

            echo "<script type='text/javascript'>alert('$message2');</script>";
            header('refresh:0');
        }
    }


    public function view_staff()
    {

        $connection = $this->openConn();

        $stmt = $connection->prepare("SELECT * from tbl_staff ORDER BY id DESC");
        $stmt->execute();
        $view = $stmt->fetchAll();
        //$rows = $stmt->
        return $view;
    }

    public function view_single_staff()
    {

        $id_staff = $_GET['id_staff'];

        $connection = $this->openConn();
        $stmt = $connection->prepare("SELECT * FROM tbl_user where id_user = '$id_staff'");
        $stmt->execute();
        $view = $stmt->fetch();
        $total = $stmt->rowCount();

        //eto yung condition na i ch check kung may laman si products at i re return niya kapag meron
        if ($total > 0) {
            return $view;
        } else {
            return false;
        }
    }

    public function update_staff()
    {
        if (isset($_POST['update_staff'])) {
            $id = (int)$_POST['id'];
            $fullname = trim($_POST['fullname']);
            $term_started = $_POST['term_started'];
            $term_ended = $_POST['term_ended'];
            $position = $_POST['position'];
            $status = $_POST['status'];

            if (!in_array($status, ['Active', 'Inactive'])) {
                echo "<script type='text/javascript'>alert('Invalid staff status');</script>";
                return;
            }

            if (!empty($term_started) && !empty($term_ended) && $term_started > $term_ended) {
                echo "<script type='text/javascript'>alert('Term Ended must be later than or equal to Term Started');</script>";
                return;
            }

            $connection = $this->openConn();
            $stmt = $connection->prepare("UPDATE tbl_staff SET `fullname` = ?, `term_started` = ?, `term_ended` = ?, `position` = ?, `status` = ? WHERE id = ?");
            $stmt->execute([$fullname, $term_started, $term_ended, $position, $status, $id]);

            $message2 = "Staff record updated";

            echo "<script type='text/javascript'>alert('$message2');</script>";
            header('refresh:0');
        }
    }

    public function delete_staff()
    {

        $id = (int)$_POST['id'];

        if (isset($_POST['delete_staff'])) {
            $connection = $this->openConn();
            $stmt = $connection->prepare("DELETE FROM tbl_staff where id = ?");
            $stmt->execute([$id]);

            $message2 = "Staff record deleted";

            echo "<script type='text/javascript'>alert('$message2');</script>";
            header('refresh:0');
        }
    }

    //--------------------------------------------- EXTRA FUNCTIONS FOR STAFF -------------------------------------------------

    public function get_single_staff($id)
    {

        $connection = $this->openConn();
        $stmt = $connection->prepare("SELECT * FROM tbl_staff where id = ?");
        $stmt->execute([(int)$id]);
        $user = $stmt->fetch();
        $total = $stmt->rowCount();

        if ($total > 0) {
            return $user;
        } else {
            return false;
        }
    }


    public function check_staff($fullname, $position, $term_started)
    {

        $connection = $this->openConn();
        $stmt = $connection->prepare("SELECT * FROM tbl_staff WHERE fullname = ? AND position = ? AND term_started = ?");
        $stmt->Execute([$fullname, $position, $term_started]);
        $total = $stmt->rowCount();

        return $total;
    }

    public function count_staff()
    {
        $connection = $this->openConn();

        $stmt = $connection->prepare("SELECT COUNT(*) from tbl_staff");
        $stmt->execute();
        $staffcount = $stmt->fetchColumn();

        return $staffcount;
    }

    public function count_mstaff()
    {
        $connection = $this->openConn();

        $stmt = $connection->prepare("SELECT 0");
        $stmt->execute();
        $staffcount = $stmt->fetchColumn();

        return $staffcount;
    }

    public function count_fstaff()
    {
        $connection = $this->openConn();

        $stmt = $connection->prepare("SELECT 0");
        $stmt->execute();
        $staffcount = $stmt->fetchColumn();

        return $staffcount;
    }


    //===================================== SCOPE CHANGED FEATURES =======================================

    public function view_staff_male()
    {
        $connection = $this->openConn();
        $stmt = $connection->prepare("SELECT * from tbl_user WHERE `sex` = 'Male'");
        $stmt->execute();
        $view = $stmt->fetchAll();
        return $view;
    }

    public function view_staff_female()
    {
        $connection = $this->openConn();
        $stmt = $connection->prepare("SELECT * from tbl_user WHERE `sex` = 'Female'");
        $stmt->execute();
        $view = $stmt->fetchAll();
        return $view;
    }


    //================ OFFICIALS ===============
    public function check_official_existence($name, $position)
    {
        $connection = $this->openConn();
        $stmt = $connection->prepare("SELECT COUNT(*) FROM tbl_officials WHERE `name` = ? AND `position` = ?");
        $stmt->execute([$name, $position]);
        return $stmt->fetchColumn();
    }


    public function create_official()
    {

        if (isset($_POST['add_official'])) {
            $name = $_POST['name'];

            //validate if the name is existing already in the database ?
            if ($this->check_official_existence($name, $_POST['position']) > 0) {
                echo "<script type='text/javascript'>alert('Official already exists!');</script>";
                return;
            }

            $position = ($_POST['position']);
            $termstart = $_POST['termstart'];
            $termend = $_POST['termend'];

            $connection = $this->openConn();
            $stmt = $connection->prepare("INSERT INTO tbl_officials (`name`,`position`,`termstart`,`termend`) VALUES (?, ?, ?, ?)");

            $stmt->Execute([$name, $position, $termstart, $termend]);
            $message2 = "New Official Adedd";

            echo "<script type='text/javascript'>alert('$message2');</script>";
            header('refresh:0');
        }
    }


    public function view_official()
    {

        $connection = $this->openConn();

        $stmt = $connection->prepare("SELECT * from tbl_officials");
        $stmt->execute();
        $view = $stmt->fetchAll();

        //$rows = $stmt->
        return $view;
    }


    public function update_official()
    {
        if (isset($_POST['update_official'])) {
            $id_official = $_GET['id_official'];
            $lname = $_POST['lname']; // Assuming these are the values from the form
            $fname = $_POST['fname'];
            $mi = $_POST['mi'];
            $name = $fname . ' ' . $mi . ' ' . $lname;
            $position = $_POST['position'];
            $termstart = $_POST['termstart'];
            $termend = $_POST['termend'];

            $connection = $this->openConn();
            $stmt = $connection->prepare("UPDATE tbl_officials SET name =?, 
                    position = ?, termstart =?, termend =? WHERE id_official = ?");
            $stmt->execute([$name, $position, $termstart, $termend, $id_official]);

            $message2 = "Official's Information Updated";

            echo "<script type='text/javascript'>alert('$message2');</script>";
            header('refresh:0');
        }
    }

    public function delete_official()
    {

        $id_official = $_POST['id_official'];

        if (isset($_POST['delete_official'])) {
            $connection = $this->openConn();
            $stmt = $connection->prepare("DELETE FROM tbl_officials where id_official = ?");
            $stmt->execute([$id_official]);

            $message2 = "Official Account Deleted";

            echo "<script type='text/javascript'>alert('$message2');</script>";
            header('refresh:0');
        }
    }

    public function get_single_official($id_official)
    {

        $id_official = $_GET['id_official'];

        $connection = $this->openConn();
        $stmt = $connection->prepare("SELECT * FROM tbl_officials where id_official = ?");
        $stmt->execute([$id_official]);
        $user = $stmt->fetch();
        $total = $stmt->rowCount();

        if ($total > 0) {
            return $user;
        } else {
            return false;
        }
    }

    //========================== POSITION ==========================================

    public function create_position()
    {

        if (isset($_POST['add_position'])) {
            $position = ($_POST['position']);
            $pos_order = $_POST['pos_order'];

            $connection = $this->openConn();
            $stmt = $connection->prepare("INSERT INTO position (`position`,`pos_order`) VALUES (?, ?)");

            $stmt->Execute([$position, $pos_order]);
            $message2 = "New Position Adedd";

            echo "<script type='text/javascript'>alert('$message2');</script>";
            header('refresh:0');
        }
    }

    public function view_position()
    {

        $connection = $this->openConn();

        $stmt = $connection->prepare("SELECT * from position");
        $stmt->execute();
        $view = $stmt->fetchAll();

        //$rows = $stmt->
        return $view;
    }


    public function update_position()
    {
        if (isset($_POST['update_position'])) {
            $id_position = $_GET['id_position'];
            $position = $_POST['position']; // Assuming these are the values from the form
            $pos_order = $_POST['pos_order'];

            $connection = $this->openConn();
            $stmt = $connection->prepare("UPDATE position SET position = ?, pos_order =? WHERE id_position = ?");
            $stmt->execute([$position, $pos_order, $id_position]);

            $message2 = "Position Information Updated Successfully!";

            echo "<script type='text/javascript'>alert('$message2');</script>";
            header('refresh:0');
        }
    }

    public function delete_position()
    {

        $id_position = $_POST['id_position'];

        if (isset($_POST['delete_position'])) {
            $connection = $this->openConn();
            $stmt = $connection->prepare("DELETE FROM position where id_position = ?");
            $stmt->execute([$id_position]);

            $message2 = "Position Deleted";

            echo "<script type='text/javascript'>alert('$message2');</script>";
            header('refresh:0');
        }
    }

    public function get_single_position($id_position)
    {

        $id_position = $_GET['id_position'];

        $connection = $this->openConn();
        $stmt = $connection->prepare("SELECT * FROM position where id_position = ?");
        $stmt->execute([$id_position]);
        $user = $stmt->fetch();
        $total = $stmt->rowCount();

        if ($total > 0) {
            return $user;
        } else {
            return false;
        }
    }
}
$staffbmis = new StaffClass();
