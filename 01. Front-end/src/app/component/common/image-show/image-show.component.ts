import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

@Component({
  selector: 'app-image-show',
  templateUrl: './image-show.component.html',
  styleUrls: ['./image-show.component.css']
})
export class ImageShowComponent implements OnInit {

  private image: string;
  private name: string;
  private flagShow: boolean;

  constructor(
    public dialogRef: MatDialogRef<ImageShowComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) { }

  ngOnInit() {

    // If that is a brand logo
    if (this.data.brandName != undefined ) {
      this.name = this.data.brandName;
      this.image = this.data.logo;
      this.flagShow = false;
    }

    // If that is a product image
    if (this.data.productName != undefined ) {
      this.name = this.data.productName;
      this.image = this.data.image;
      this.flagShow = true;
    }
  }
}