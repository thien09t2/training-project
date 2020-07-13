import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {
  MatTableModule,
  MatSortModule,
  MatButtonModule,
  MatIconModule,
  MatToolbarModule,
  MatMenuModule,
  MatFormFieldModule,
  MatInputModule,
  MatTooltipModule,
  MatSnackBarModule,
  MatDialogModule,
} from '@angular/material';
import { MatSelectModule } from '@angular/material/select';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HTTP_INTERCEPTORS } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './Component/login/login.component';
import { ProductComponent } from './Component/product/product.component';
import { BrandComponent } from './Component/brand/brand.component';
import { LoginService } from './Service/login.service';
import { ProductService } from './Service/product.service';
import { BrandService } from './Service/brand.service';
import { AddProductComponent } from './Component/product/dialog/add-product/add-product.component';
import { EditProductComponent } from './Component/product/dialog/edit-product/edit-product.component';
import { AddBrandComponent } from './Component/brand/dialog/add-brand/add-brand.component';
import { EditBrandComponent } from './Component/brand/dialog/edit-brand/edit-brand.component';
import { InterceptorService } from './Service/interceptor.service';
import { ImageShowComponent } from './Component/common/image-show/image-show.component';
import { NavBarComponent } from './Component/common/nav-bar/nav-bar.component';
import { SnackBarService } from './Component/common/snack-bar/snack-bar.service';
import { DialogDeleteComponent } from './Component/common/dialog-delete/dialog-delete.component';
import { LoginGuard } from './Service/login.guard';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    ProductComponent,
    BrandComponent,
    AddProductComponent,
    EditProductComponent,
    AddBrandComponent,
    EditBrandComponent,
    ImageShowComponent,
    NavBarComponent,
    DialogDeleteComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    MatTableModule,
    MatSortModule,
    MatButtonModule,
    MatIconModule,
    MatToolbarModule,
    MatMenuModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatTooltipModule,
    MatSnackBarModule,
    MatDialogModule,
  ],

  entryComponents: [
    AddProductComponent,
    EditProductComponent,
    AddBrandComponent,
    EditBrandComponent,
    ImageShowComponent,
    DialogDeleteComponent
  ],
  providers: [
    LoginService,
    ProductService,
    BrandService,
    SnackBarService,
    LoginGuard,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: InterceptorService,
      multi: true
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }