import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BuscarImagenComponent } from './buscar-imagen.component';

describe('BuscarImagenComponent', () => {
  let component: BuscarImagenComponent;
  let fixture: ComponentFixture<BuscarImagenComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BuscarImagenComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BuscarImagenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
