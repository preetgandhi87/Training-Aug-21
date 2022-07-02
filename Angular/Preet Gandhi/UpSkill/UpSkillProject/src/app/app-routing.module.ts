import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AboutUsComponent } from './about-us/about-us.component';
import { ContactUsComponent } from './contact-us/contact-us.component';
import { EmployeeDashboardComponent } from './employee-dashboard/employee-dashboard.component';

const routes: Routes = [
  { path: '', redirectTo: 'home', pathMatch:'full' },
  {path: 'home', component: HomeComponent},
  {path: 'about-us', component: AboutUsComponent},
  {path: 'about', redirectTo: 'about-us'},
  {path: 'contact-us', component: ContactUsComponent},
  {path: 'contact', redirectTo: 'contact-us'},
  {path: 'employee', component:EmployeeDashboardComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
