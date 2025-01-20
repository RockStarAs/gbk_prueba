import { TestBed } from '@angular/core/testing';

import { PreagenteService } from './preagente.service';

describe('PreagenteService', () => {
  let service: PreagenteService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(PreagenteService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
