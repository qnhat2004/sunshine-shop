package com.sunshine_shop.service.interfaceService;

import com.sunshine_shop.entity.Supplier;

import java.util.List;

public interface ISupplierService {
     Supplier createSupplier(Supplier supplier);
     Supplier updateSupplier(Long id, Supplier supplier);
     void deleteSupplier(Long id);
     Supplier getSupplierById(Long id);
     List<Supplier> getAllSuppliers();
}
