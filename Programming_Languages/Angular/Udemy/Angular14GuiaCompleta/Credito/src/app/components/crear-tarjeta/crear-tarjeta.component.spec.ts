import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CrearTarjetaComponent } from './crear-tarjeta.component';

describe('CrearTarjetaComponent', () => {
  let component: CrearTarjetaComponent;
  let fixture: ComponentFixture<CrearTarjetaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CrearTarjetaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CrearTarjetaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
