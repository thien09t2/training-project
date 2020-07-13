import { Component, OnInit, ViewChild } from '@angular/core';
import { MatSort, MatTableDataSource, MatDialog } from '@angular/material';
import { FormBuilder, FormGroup } from '@angular/forms';
import { product } from '../model/product.model';
import { ProductService } from 'src/app/Service/product.service';
import { BrandService } from 'src/app/Service/brand.service';
import { SnackBarService } from '../common/snack-bar/snack-bar.service';
import { AddProductComponent } from './dialog/add-product/add-product.component';
import { EditProductComponent } from './dialog/edit-product/edit-product.component';
import { ImageShowComponent } from '../common/image-show/image-show.component';
import { DialogDeleteComponent } from '../common/dialog-delete/dialog-delete.component';
import { isUnablePrice } from '../common/validation/validators';
import { messageServerError } from '../common/constrains';
 
@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {

  @ViewChild(MatSort, { static: true }) sort: MatSort;

  private formSearch: FormGroup;
  private productsList: product[];
  private dataSource: any;
  private totalPage: number;
  private brandNamesList: string[];
  private pageNumbersList: Array<number>;
  private flagAction: boolean;

  // Set default value variable
  private currentPage = 0;
  private flagSearch = false;
  private flagServerError = false;

  // Columns display
  private displayedColumns: string[] = [
    'productId', 'productName', 'quantity', 'price', 'brandEntity', 'saleDate', 'image', 'actions'
  ];

   // Form search null
   private formSearchNull = { 'productName': '', 'brandName': '', 'priceFrom': 0, 'priceTo': 0 };

  constructor(
    private service: ProductService,
    private fb: FormBuilder,
    private dialog: MatDialog,
    private snackBar: SnackBarService,
    private brandService: BrandService,
  ) { }

  ngOnInit() {

    // Get products first page
    this.searchProductsList(this.formSearchNull)

    // Reactive form search products
    this.formSearch = this.fb.group({
      productName: '',
      brandName: '',
      priceFrom: 0,
      priceTo: 0
    })

    // Set data for brand name select
    this.brandService.getAllBrandName()
      .subscribe(brandNames => {
        this.brandNamesList = brandNames
      })

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
   * Search products list
   * 
   * @param body
   */
  searchProductsList(body: any) {

    // Price validation
    if (isUnablePrice(body)) {
      this.snackBar.getSnackBarFail('Unable to determine price')
      return false;
    }

    // Function search products list
    this.service.getProductsByPageable(this.currentPage, body)
      .subscribe(resp => {
        // Set data table
        this.productsList = resp['responseData'],
        this.pageNumbersList = resp['pageNumbersList'],
        this.totalPage = resp['totalPage'],
        this.dataSource = new MatTableDataSource(this.productsList),
        this.dataSource.sort = this.sort
      },
        // If server error
        error => {
          this.flagServerError = true;
        })

    // If using search
    if (body.productName != '' || body.brandName != '' || body.priceFrom != 0 || body.priceTo != 0) {
      this.flagSearch = true;
    }
  }

  /**
   * Change page data table
   * 
   * @param currentPage
   */
  setPageChange(currentPage: number) {
    this.currentPage = currentPage;
    this.flagSearch ? this.searchProductsList(this.formSearch.value) : 
    this.searchProductsList(this.formSearchNull)
  }

  /**
   * Show product image
   * 
   * @param image
   */
  showImage(image) {
    this.dialog.open(ImageShowComponent, {
      data: image
    })
  }

  /**
   * Insert product
   */
  insertProduct() {

    // Open dialog
    let dialogRef = this.dialog.open(AddProductComponent, {
      maxHeight: '95vh'
    });
    dialogRef.afterClosed().subscribe(result => {
      if (result != null) {
        this.snackBar.getSnackBarSuccess(result)

        // Refresh data table
        this.ngOnInit()
      }
    })
  }

  /**
   * Update product
   * 
   * @param product
   */
  updateProduct(product) {

    // Open dialog
    let dialogRef = this.dialog.open(EditProductComponent, {
      data: product,
      maxHeight: '95vh'
    });
    dialogRef.afterClosed().subscribe(result => {
      if (result != null) {
        this.snackBar.getSnackBarSuccess(result);

        // Refresh data table
        this.ngOnInit();
      }
    })
  }

  /**
   * Delete product
   * 
   * @param product
   */
  deleteProduct(product) {

    // Product delete
    const productDelete = {
      "productId": product.productId, "productName": product.productName, "quantity": product.quantity,
      "price": product.price, "brandEntity": product.brandEntity, "saleDate": new Date(product.saleDate),
      "image": product.image, "description": product.description
    }

    // Open dialog
    let dialogRef = this.dialog.open(DialogDeleteComponent, {
      data: product
    });
    dialogRef.afterClosed().subscribe(result => {
      if (result != null) {

        // Function delete product
        this.service.deleteProduct(productDelete)
          .subscribe(resp => {
            this.snackBar.getSnackBarSuccess(resp['message'])

            // Refresh data table
            this.ngOnInit();
          },
            // If server error
            error => {
              this.snackBar.getSnackBarFail(messageServerError)
            })
      }
    })
  }
}