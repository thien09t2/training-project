import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { MatTableDataSource, MatSort, MatDialog } from '@angular/material';
import { HttpErrorResponse } from '@angular/common/http';
import { brand } from '../model/brand.model';
import { BrandService } from 'src/app/Service/brand.service';
import { SnackBarService } from 'src/app/Component/common/snack-bar/snack-bar.service';
import { AddBrandComponent } from './dialog/add-brand/add-brand.component';
import { EditBrandComponent } from './dialog/edit-brand/edit-brand.component';
import { ImageShowComponent } from '../common/image-show/image-show.component';
import { DialogDeleteComponent } from '../common/dialog-delete/dialog-delete.component';
import { messageServerError } from '../common/constrains';

@Component({
  selector: 'app-brand',
  templateUrl: './brand.component.html',
  styleUrls: ['./brand.component.css']
})
export class BrandComponent implements OnInit {

  @ViewChild(MatSort, { static: true }) sort: MatSort;

  private brandsList: Array<brand>;
  private dataSource: any;
  private totalPage: number;
  private pageNumbersList: Array<number>;
  private flagAction: boolean;

  // Set default value variable
  private flagSearch = false;
  private currentPage = 0;
  private nameSearcher = '';
  private flagServerError = false;

  // Columns display
  private displayedColumns: string[] = [
    'brandId', 'brandName', 'logo', 'description', 'actions'
  ];

  constructor(
    private fb: FormBuilder,
    private brandService: BrandService,
    private dialog: MatDialog,
    private snackBar: SnackBarService
  ) { }

  ngOnInit() {
 
    // Get brands first page
    this.searchBrandsList('');

    // Display actions
    localStorage.getItem('access_token') != null ?
      this.flagAction = true :
      this.flagAction = false;
  }

  /**
   * Receive event logout from navigation
   */
  receiveEvent() {
    this.ngOnInit();
  }

  /**
   * Search brands list
   * 
   * @param brandName
   */
  searchBrandsList(brandName: string) {

    // Function search brands list
    this.brandService.getBrandsByPageable(this.currentPage, brandName)
      .subscribe(resp => {
        // Set data table
        this.brandsList = resp['responseData'],
        this.pageNumbersList = resp['pageNumbersList'],
        this.totalPage = resp['totalPage'],
        this.dataSource = new MatTableDataSource(this.brandsList),
        this.dataSource.sort = this.sort
      },
        // If server error
        error => {
          this.flagServerError = true;
        })
    
    // If using search
    if (brandName != '') {
      this.flagSearch = true;
    }
  }
    
  /**
   * set page change
   * 
   * @param currentPage
   */
  setPageChange(currentPage: any) {
    this.currentPage = currentPage;
    this.flagSearch ? this.searchBrandsList(this.nameSearcher) :
    this.searchBrandsList('');
  }

  /**
   * Show logo
   * 
   * @param image
   */
  showLogo(image) {
    this.dialog.open(ImageShowComponent, {
      data: image
    })
  }

  /**
   * Insert Brand
   */
  insertBrand() {

    // Open dialog
    let dialogRef = this.dialog.open(AddBrandComponent, {
      maxHeight: '95vh'
    });
    dialogRef.afterClosed().subscribe(result => {
      if (result != null) {
        this.snackBar.getSnackBarSuccess(result)

        // Refresh data table
        this.ngOnInit();
      }
    })
  }

  /**
   * Update brand
   * 
   * @param brand
   */
  updateBrand(brand) {

    // Open dialog
    let dialogRef = this.dialog.open(EditBrandComponent, {
      data: brand,
      maxHeight: '95vh'
    })
    dialogRef.afterClosed().subscribe(result => {
      if (result != null) {
        this.snackBar.getSnackBarSuccess(result)

        // Refresh data table
        this.ngOnInit();
      }
    })
  }

  /**
   * Delete brand
   * 
   * @param brand
   */
  deleteBrand(brand) {

    // Open dialog
    let dialogRef = this.dialog.open(DialogDeleteComponent, {
      data: brand
    })
    dialogRef.afterClosed().subscribe(result => {
      if (result != null) {

        // Function delete brand
        this.brandService.deleteBrand(brand)
          .subscribe(resp => {
            this.snackBar.getSnackBarSuccess(resp['message'])

            // Refresh data table
            this.ngOnInit();
          },
            // Catch delete error
            error => {
              (error instanceof HttpErrorResponse && error.status === 500) ?
              // If the brand already exists in the products list
              this.snackBar.getSnackBarFail('Cannot delete brand') :
              // If server error
              this.snackBar.getSnackBarFail(messageServerError)
            })
      }
    })
  }
}