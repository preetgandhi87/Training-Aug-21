import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { EmployeeModel } from './employee-dashboard.model';
import { ApiService } from '../Shared/api.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-employee-dashboard',
  templateUrl: './employee-dashboard.component.html',
  styleUrls: ['./employee-dashboard.component.css']
})
export class EmployeeDashboardComponent implements OnInit {

  formValue !: FormGroup;
  employeeObj: EmployeeModel = new EmployeeModel();
  employeeData!: any;
  saveBtn = false;
  updateBtn = false;
  constructor(private formBuilder: FormBuilder, 
    private api: ApiService,
    private toastr: ToastrService) { }

  ngOnInit(): void {
    this.formValue =this.formBuilder.group({
      firstName: ['',Validators.required],
      lastName: ['',Validators.required],
      email: ['',[Validators.required,Validators.email]],
      mobile: ['',[Validators.required,Validators.pattern("^((\\+91-?)|0)?[0-9]{10}$")]],
      salary: ['',[Validators.required,Validators.minLength(5)]],
    })
    this.getAllEmployees();
  }

  clickAddEmployee(){
    this.formValue.reset();
    this.saveBtn = true;
    this.updateBtn = false;
  }

  postEmployeeDetails(){
    this.employeeObj.firstName = this.formValue.value.firstName;
    this.employeeObj.lastName = this.formValue.value.lastName;
    this.employeeObj.email = this.formValue.value.email;
    this.employeeObj.mobile = this.formValue.value.mobile;
    this.employeeObj.salary = this.formValue.value.salary;

    this.api.postEmployee(this.employeeObj).subscribe(res => {
      console.log(res);
      this.toastr.success("Employee added successfully");
      alert("Employee added successfully");
      this.formValue.reset();
      this.getAllEmployees();
    },
    err=>{
      this.toastr.error("Something went wrong");
      alert("Something went wrong");
    })
  }

  getAllEmployees(){
    this.api.getEmployee().subscribe(res => {
      this.employeeData = res;
    })
  }

  deleteEmploye(emp: any){
    this.api.deleteEmployee(emp.id).subscribe(res => {
      this.toastr.error("Employee deleted");
      alert("Employee deleted");
      this.getAllEmployees();
    })
  }

  editEmployee(emp: any){
    this.updateBtn = true;
    this.saveBtn = false;
    this.employeeObj.id = emp.id;
    this.formValue.controls['firstName'].setValue(emp.firstName);
    this.formValue.controls['lastName'].setValue(emp.lastName);
    this.formValue.controls['email'].setValue(emp.email);
    this.formValue.controls['mobile'].setValue(emp.mobile);
    this.formValue.controls['salary'].setValue(emp.salary);
  }

  updateEmployeeDetails(){
    this.employeeObj.firstName = this.formValue.value.firstName;
    this.employeeObj.lastName = this.formValue.value.lastName;
    this.employeeObj.email = this.formValue.value.email;
    this.employeeObj.mobile = this.formValue.value.mobile;
    this.employeeObj.salary = this.formValue.value.salary;
    this.api.updateEmployee(this.employeeObj,this.employeeObj.id).subscribe(res => {
       alert("Updated Successfully");
       this.formValue.reset();
       this.getAllEmployees();
    })
  }

  get firstName(){
    return this.formValue.get('firstName');
  }
  get lastName(){
    return this.formValue.get('lastName');
  }
  get email(){
    return this.formValue.get('email');
  }
  get mobile(){
    return this.formValue.get('mobile');
  }
  get salary(){
    return this.formValue.get('salary');
  }
}
