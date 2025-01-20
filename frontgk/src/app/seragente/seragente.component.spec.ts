import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SeragenteComponent } from './seragente.component';

describe('SeragenteComponent', () => {
  let component: SeragenteComponent;
  let fixture: ComponentFixture<SeragenteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SeragenteComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SeragenteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
