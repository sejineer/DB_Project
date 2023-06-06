package db.project.controller;

import db.project.dto.EmailFormReq;
import db.project.dto.FindRecordReq;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ViewController {

    @GetMapping("/driver-test")
    public String driverTest() {
        return "driverTest";
    }

    @GetMapping("/insert-test")
    public String insertTest() {
        return "insertTest";
    }

    @GetMapping("/insert-test-form")
    public String insertTestForm() {
        return "insertTestForm";
    }

    @GetMapping("/select-test")
    public String selectTest() {
        return "selectTest";
    }

    @GetMapping("/find-diary-by-email")
    public String findDiaryByEmail() {
        return "findDiaryByEmailForm";
    }

    @PostMapping("/find-diary-by-email-res")
    public String findDiaryByEmailRes() {
        return "findDiaryByEmailRes";
    }

    @GetMapping("/find-record")
    public String findRecord(){
        return "findRecordByUserForm";
    }

    @PostMapping("/find-record-res")
    public String findRecordRes() {
        return "findRecordByUserRes";
    }

    @GetMapping("/find-record-by-user-and-diary")
    public String findRecordByUserAndDiary(){
        return "findRecordByUserAndDiaryForm";
    }

    @PostMapping("/find-record-by-user-and-diary-res")
    public String findRecordByUserAndDiaryRes() {
        return "findRecordByUserAndDiaryRes";
    }

}
