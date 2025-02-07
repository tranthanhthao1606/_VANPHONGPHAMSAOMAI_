﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using BusinessLayer;

namespace BusinessLayer
{
    public class NHANVIEN{
        Entities db;
        public NHANVIEN(){
            db = Entities.CreateEntities();
        }

        public List<NHAN_VIEN> getAll(){
            var lst = db.NHAN_VIEN.ToList();

            List<NHAN_VIEN> lstNV = new List<NHAN_VIEN>();
            NHAN_VIEN objNV;

            foreach (var item in lst){
                if (item.TENDANGNHAP == "ADMIN" || item.TENDANGNHAP == "admin"){
                }
                else{
                    objNV = new NHAN_VIEN();
                    objNV.MANHANVIEN = item.MANHANVIEN;
                    objNV.TENNHANVIEN = item.TENNHANVIEN;
                    objNV.SDT = item.SDT;
                    objNV.NGAYSINH = item.NGAYSINH;
                    objNV.DIACHI = item.DIACHI;
                    objNV.TENDANGNHAP = item.TENDANGNHAP;
                    objNV.MATKHAU = item.MATKHAU;
                    objNV.GIOITINH = item.GIOITINH;
                    objNV.VOHIEUHOA = item.VOHIEUHOA;
                    objNV.LAQUANLY = item.LAQUANLY;
                    objNV.CMND_CCCD = item.CMND_CCCD;
                    lstNV.Add(objNV);
                }
            }
            return lstNV.OrderBy(x => x.TENNHANVIEN).ToList();
        }

        public NHAN_VIEN getItem(string manv){
            return db.NHAN_VIEN.FirstOrDefault(x => x.MANHANVIEN == manv);
        }

        public NHAN_VIEN getItemDN(string user, string pass){
            return db.NHAN_VIEN.FirstOrDefault(x => x.TENDANGNHAP == user && x.MATKHAU == pass && x.VOHIEUHOA == false);
        }

        public NHAN_VIEN getItemByTDN(string tendangnhap){
            return db.NHAN_VIEN.FirstOrDefault(x => x.TENDANGNHAP == tendangnhap);
        }

        public NHAN_VIEN getItemQMK(DateTime ngaysinh, string cmnd, string ten, string diachi){
            return db.NHAN_VIEN.FirstOrDefault(x => x.NGAYSINH == ngaysinh && x.CMND_CCCD == cmnd && x.TENNHANVIEN == ten && x.DIACHI == diachi);
        }

        public List<NHAN_VIEN> getItemQMK(string sdt){
            return db.NHAN_VIEN.Where(x => x.SDT == sdt).ToList();
        }

        public List<NHAN_VIEN> getItemByQuyen1(bool t){
            return db.NHAN_VIEN.Where(x => x.LAQUANLY == t).ToList();
        }

        public List<NHAN_VIEN> getItemByQuyen(bool t){
            var lst = db.NHAN_VIEN.Where(x => x.LAQUANLY == t).ToList();

            List<NHAN_VIEN> lstNV = new List<NHAN_VIEN>();
            NHAN_VIEN objNV;

            foreach (var item in lst){
                if (item.TENDANGNHAP == "ADMIN" || item.TENDANGNHAP == "admin"){}
                else{
                    objNV = new NHAN_VIEN();
                    objNV.MANHANVIEN = item.MANHANVIEN;
                    objNV.TENNHANVIEN = item.TENNHANVIEN;
                    objNV.SDT = item.SDT;
                    objNV.NGAYSINH = item.NGAYSINH;
                    objNV.DIACHI = item.DIACHI;
                    objNV.TENDANGNHAP = item.TENDANGNHAP;
                    objNV.MATKHAU = item.MATKHAU;
                    objNV.GIOITINH = item.GIOITINH;
                    objNV.VOHIEUHOA = item.VOHIEUHOA;
                    objNV.LAQUANLY = item.LAQUANLY;
                    objNV.CMND_CCCD = item.CMND_CCCD;
                    lstNV.Add(objNV);
                }
            }
            return lstNV.OrderBy(x => x.TENNHANVIEN).ToList();
        }

        public bool kiemtraQuyen(string tentaikhoan){
            var nv = db.NHAN_VIEN.FirstOrDefault(x => x.TENDANGNHAP == tentaikhoan);
            return (bool)nv.LAQUANLY;
        }

        public void add(NHAN_VIEN nv){
            try{
                db.NHAN_VIEN.Add(nv);
                db.SaveChanges();
            }
            catch (Exception ex){
                throw new Exception("Có lỗi xảy ra trong quá trình xử lý dữ liệu. " + ex.Message);
            }
        }

        public void update(NHAN_VIEN nv){
            NHAN_VIEN _nv = db.NHAN_VIEN.FirstOrDefault(x => x.MANHANVIEN == nv.MANHANVIEN);
            _nv.TENNHANVIEN = nv.TENNHANVIEN;
            _nv.DIACHI = nv.DIACHI;
            _nv.SDT = nv.SDT;
            _nv.GIOITINH = nv.GIOITINH;
            _nv.NGAYSINH = nv.NGAYSINH;
            _nv.CMND_CCCD = nv.CMND_CCCD;
            _nv.MATKHAU = nv.MATKHAU;
            _nv.VOHIEUHOA = nv.VOHIEUHOA;
            try{
                db.SaveChanges();
            }
            catch (Exception ex){
                throw new Exception("Có lỗi xảy ra trong quá trình xử lý dữ liệu. " + ex.Message);
            }
        }

        public void updateMK(string tendn, string tk){
            NHAN_VIEN _nv = db.NHAN_VIEN.FirstOrDefault(x => x.TENDANGNHAP == tendn);
            _nv.MATKHAU = tk;
            try{
                db.SaveChanges();
            }
            catch (Exception ex){
                throw new Exception("Có lỗi xảy ra trong quá trình xử lý dữ liệu. " + ex.Message);
            }
        }

        public void disable(string manv){
            NHAN_VIEN nv = db.NHAN_VIEN.FirstOrDefault(x => x.MANHANVIEN == manv);
            nv.VOHIEUHOA = true;
            try{
                db.SaveChanges();
            }
            catch (Exception ex){
                throw new Exception("Có lỗi xảy ra trong quá trình xử lý dữ liệu. " + ex.Message);
            }
        }

        public void chuyenQuyen(string manv, bool t){
            NHAN_VIEN nv = db.NHAN_VIEN.FirstOrDefault(x => x.MANHANVIEN == manv);
            nv.LAQUANLY = t;
            try{
                db.SaveChanges();
            }
            catch (Exception ex){
                throw new Exception("Có lỗi xảy ra trong quá trình xử lý dữ liệu. " + ex.Message);
            }
        }
    }
}
