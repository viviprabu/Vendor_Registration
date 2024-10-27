import 'package:finance_app/app/features/sector/data/models/sector_create_modal.dart';
import 'package:finance_app/app/features/sector/data/models/sector_modal.dart';

abstract interface class SectorRemoteDataSource {
  Future<SectorModal> getSector(String id);
  Future<SectorModal> updateSector(SectorModal sectorModel);
  Future<SectorModal> deleteSector(SectorModal sectorModel);
  Future<SectorModal> createSector(SectorCreateModal sectorCreateModel);
  Future<List<SectorModal>> getSectors();
}
