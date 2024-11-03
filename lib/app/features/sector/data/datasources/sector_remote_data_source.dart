import 'package:finance_app/app/features/sector/data/models/sector_modal.dart';

abstract interface class SectorRemoteDataSource {
  Future<SectorModal> getSector(int id);
  Future<SectorModal> updateSector(SectorModal sectorModel);
  Future<SectorModal> deleteSector(SectorModal sectorModel);
  Future<SectorModal> createSector(SectorModal sectorModel);
  Future<List<SectorModal>> getSectors();
}
