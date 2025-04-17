import { Test, TestingModule } from '@nestjs/testing';
import { AnythingController } from './anything.controller';

describe('AnythingController', () => {
  let controller: AnythingController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [AnythingController],
    }).compile();

    controller = module.get<AnythingController>(AnythingController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
