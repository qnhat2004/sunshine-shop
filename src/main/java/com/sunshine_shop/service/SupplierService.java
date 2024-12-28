package com.sunshine_shop.service;

import com.sunshine_shop.entity.Supplier;
import com.sunshine_shop.repository.SupplierRepository;
import com.sunshine_shop.service.interfaceService.ISupplierService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@AllArgsConstructor
public class SupplierService implements ISupplierService {
    private final SupplierRepository supplierRepository;

    @Override
    @Transactional
    public Supplier createSupplier(Supplier supplier) {
        Supplier newSupplier = Supplier.builder()
                .name(supplier.getName())
                .address(supplier.getAddress())
                .phone(supplier.getPhone())
                .build();
        return supplierRepository.save(newSupplier);
    }

    @Override
    public Supplier updateSupplier(Long id, Supplier supplier) {
        Supplier currentSupplier = getSupplierById(id);
        currentSupplier.setName(supplier.getName());
        currentSupplier.setAddress(supplier.getAddress());
        currentSupplier.setPhone(supplier.getPhone());
        return supplierRepository.save(currentSupplier);
    }

    @Override
    public void deleteSupplier(Long id) {
        supplierRepository.deleteById(id);
    }

    @Override
    public Supplier getSupplierById(Long id) {
        return supplierRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Supplier not found"));
    }

    @Override
    public List<Supplier> getAllSuppliers() {
        return supplierRepository.findAll();
    }
}
