import { Component, inject, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  form!: FormGroup
  deckSize = [ 1, 2, 3, 4, 5 ]

  private fb = inject(FormBuilder)

  ngOnInit(): void {
    this.form = this.fb.group({
      deckCount: this.fb.control<number>(1, [ Validators.required, Validators.min(1) ])
    })
  }

  createDeck() {
  }

}
