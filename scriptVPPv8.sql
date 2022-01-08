USE [master]
GO
/****** Object:  Database [VANPHONGPHAM]    Script Date: 08/01/2022 11:36:19 SA ******/
CREATE DATABASE [VANPHONGPHAM]
GO
ALTER DATABASE [VANPHONGPHAM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VANPHONGPHAM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VANPHONGPHAM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET ARITHABORT OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VANPHONGPHAM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VANPHONGPHAM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VANPHONGPHAM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VANPHONGPHAM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET RECOVERY FULL 
GO
ALTER DATABASE [VANPHONGPHAM] SET  MULTI_USER 
GO
ALTER DATABASE [VANPHONGPHAM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VANPHONGPHAM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VANPHONGPHAM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VANPHONGPHAM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VANPHONGPHAM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VANPHONGPHAM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VANPHONGPHAM', N'ON'
GO
ALTER DATABASE [VANPHONGPHAM] SET QUERY_STORE = OFF
GO
USE [VANPHONGPHAM]
GO
/****** Object:  Table [dbo].[HOADON_MATHANG]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON_MATHANG](
	[MAHD] [int] NOT NULL,
	[MAMH] [varchar](5) NOT NULL,
	[SOLUONGMUA] [int] NOT NULL,
	[THANHTIEN] [float] NULL,
 CONSTRAINT [PK_HOADON_MATHANG] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC,
	[MAMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOA_DON]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOA_DON](
	[MAHOADON] [int] IDENTITY(1,1) NOT NULL,
	[NGAYLAP] [datetime] NOT NULL,
	[MANHANVIEN] [varchar](4) NOT NULL,
	[MAKH] [int] NULL,
 CONSTRAINT [PK__HOA_DON__A4999DF54B223F56] PRIMARY KEY CLUSTERED 
(
	[MAHOADON] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FNTHONGKEDOANHTHU]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[FNTHONGKEDOANHTHU]
()
RETURNS TABLE AS RETURN
select top 30 CONVERT(nvarchar, a.NGAYLAP, 103) as [Ngay], sum(b.THANHTIEN) as [TongTien]
from HOA_DON a, HOADON_MATHANG b
where a.MAHOADON = b.MAHD
group by CONVERT(nvarchar, a.NGAYLAP, 103)
order by CONVERT(nvarchar, a.NGAYLAP, 103)
GO
/****** Object:  Table [dbo].[MAT_HANG]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAT_HANG](
	[MAMH] [varchar](5) NOT NULL,
	[TENMH] [nvarchar](50) NOT NULL,
	[GIABAN] [bigint] NOT NULL,
	[DVT] [nvarchar](10) NOT NULL,
	[MALOAI] [varchar](5) NOT NULL,
	[MOTA] [nvarchar](1000) NOT NULL,
	[VOHIEUHOA] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FNMAT_HANG]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[FNMAT_HANG]
()
RETURNS TABLE AS RETURN
SELECT *
FROM MAT_HANG
GO
/****** Object:  Table [dbo].[LOAI_MAT_HANG]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAI_MAT_HANG](
	[MALOAI] [varchar](5) NOT NULL,
	[TENLOAI] [nvarchar](50) NOT NULL,
	[VOHIEUHOA] [bit] NOT NULL,
 CONSTRAINT [PK__LOAI_MAT__2F633F23626F0ADC] PRIMARY KEY CLUSTERED 
(
	[MALOAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FNLOAIMAT_HANG]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[FNLOAIMAT_HANG]
()
RETURNS TABLE AS RETURN
SELECT a.MALOAI, a.TENLOAI, b.MAMH
FROM LOAI_MAT_HANG a , MAT_HANG b
WHERE a.MALOAI = b.MALOAI
GO
/****** Object:  View [dbo].[View_1]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT    dbo.LOAI_MAT_HANG.TENLOAI, dbo.MAT_HANG.MAMH, dbo.MAT_HANG.TENMH, dbo.MAT_HANG.GIABAN, dbo.MAT_HANG.DVT, dbo.MAT_HANG.MALOAI, dbo.MAT_HANG.MOTA
FROM         dbo.MAT_HANG INNER JOIN
                      dbo.LOAI_MAT_HANG ON dbo.MAT_HANG.MALOAI = dbo.LOAI_MAT_HANG.MALOAI
GO
/****** Object:  UserDefinedFunction [dbo].[FNBANHANG]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[FNBANHANG]
()
RETURNS TABLE AS RETURN
SELECT b.TENMH, sum(a.SOLUONGMUA) as [SOLUONG]
FROM dbo.HOADON_MATHANG a,  MAT_HANG b
WHERE a.MAMH = b.MAMH
GROUP BY b.TENMH 
GO
/****** Object:  UserDefinedFunction [dbo].[FNBANHANGByTIME]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[FNBANHANGByTIME]
(
@NGAY DATETIME
)
RETURNS TABLE AS RETURN
SELECT a.NGAYLAP, c.TENMH, b.SOLUONGMUA
FROM dbo.HOA_DON a, HOADON_MATHANG b , MAT_HANG c
WHERE a.MAHOADON=b.MAHD and c.MAMH=b.MAMH and DAY(a.NGAYLAP) = day(@NGAY) and MONTH(a.NGAYLAP) = MONTH(@NGAY) and YEAR(a.NGAYLAP) = YEAR(@NGAY)
GO
/****** Object:  UserDefinedFunction [dbo].[FNBANHANGByTIMEGROUP]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[FNBANHANGByTIMEGROUP]
(
@NGAY DATETIME
)
RETURNS TABLE AS RETURN
SELECT TENMH, SUM(SOLUONGMUA) AS[SOLUONG] FROM FNBANHANGByTIME(@NGAY)
GROUP BY TENMH
GO
/****** Object:  UserDefinedFunction [dbo].[FNBANHANGByTIMEGROUPMH]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[FNBANHANGByTIMEGROUPMH]
(
@NGAY DATETIME
)
RETURNS TABLE AS RETURN
SELECT top 5 * FROM FNBANHANGByTIMEGROUP(@NGAY) ORDER BY SOLUONG DESC
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[MAKH] [int] IDENTITY(1,1) NOT NULL,
	[TENKH] [nvarchar](30) NOT NULL,
	[GIOITINH] [nvarchar](5) NOT NULL,
	[SDT] [varchar](10) NULL,
	[VOHIEUHOA] [bit] NOT NULL,
 CONSTRAINT [PK__KHACH_HA__603F592C1160B9CA] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FNKHACHHANGByTIME]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[FNKHACHHANGByTIME]
(
@NGAY DATETIME
)
RETURNS TABLE AS RETURN
SELECT    dbo.KHACH_HANG.TENKH, dbo.HOADON_MATHANG.THANHTIEN, dbo.HOA_DON.NGAYLAP
FROM         dbo.HOADON_MATHANG INNER JOIN
                      dbo.HOA_DON ON dbo.HOADON_MATHANG.MAHD = dbo.HOA_DON.MAHOADON INNER JOIN
                      dbo.KHACH_HANG ON dbo.HOA_DON.MAKH = dbo.KHACH_HANG.MAKH  and MONTH(dbo.HOA_DON.NGAYLAP) = MONTH(@NGAY) and YEAR(dbo.HOA_DON.NGAYLAP) = YEAR(@NGAY)
GO
/****** Object:  UserDefinedFunction [dbo].[FNKHACHHANGGROUP]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[FNKHACHHANGGROUP]
(
@NGAY DATETIME
)
RETURNS TABLE AS RETURN
SELECT TOP 6 TENKH, SUM(THANHTIEN) AS [THANHTIEN] FROM FNKHACHHANGByTIME(@NGAY)
GROUP BY TENKH
ORDER BY  SUM(THANHTIEN) DESC
GO
/****** Object:  Table [dbo].[DON_DAT_HANG]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DON_DAT_HANG](
	[MADDH] [int] IDENTITY(1,1) NOT NULL,
	[MANCC] [varchar](5) NOT NULL,
	[NGAYDAT] [datetime] NOT NULL,
	[MANV] [varchar](4) NOT NULL,
 CONSTRAINT [PK__DON_DAT___77CD19D144247204] PRIMARY KEY CLUSTERED 
(
	[MADDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG_MATHANG]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG_MATHANG](
	[MADDH] [int] NOT NULL,
	[MAMH] [varchar](5) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
 CONSTRAINT [PK__CT_DON_D__D1CEEF4FF94EC811] PRIMARY KEY CLUSTERED 
(
	[MADDH] ASC,
	[MAMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHA_CUNG_CAP]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHA_CUNG_CAP](
	[MANCC] [varchar](5) NOT NULL,
	[TENNCC] [nvarchar](50) NOT NULL,
	[DIACHI] [nvarchar](50) NOT NULL,
	[SDT] [char](10) NOT NULL,
	[EMAIL] [varchar](30) NOT NULL,
	[VOHIEUHOA] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MANCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAN_VIEN]    Script Date: 08/01/2022 11:36:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAN_VIEN](
	[MANHANVIEN] [varchar](4) NOT NULL,
	[TENNHANVIEN] [nvarchar](30) NOT NULL,
	[DIACHI] [nvarchar](50) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[GIOITINH] [nvarchar](5) NOT NULL,
	[NGAYSINH] [datetime] NOT NULL,
	[CMND_CCCD] [varchar](12) NOT NULL,
	[TENDANGNHAP] [varchar](10) NOT NULL,
	[MATKHAU] [varchar](16) NOT NULL,
	[VOHIEUHOA] [bit] NOT NULL,
	[LAQUANLY] [bit] NULL,
 CONSTRAINT [PK__NHAN_VIE__7E46DD91AA5EB004] PRIMARY KEY CLUSTERED 
(
	[MANHANVIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DON_DAT_HANG] ON 

INSERT [dbo].[DON_DAT_HANG] ([MADDH], [MANCC], [NGAYDAT], [MANV]) VALUES (12, N'NCC03', CAST(N'2022-01-07T08:07:46.713' AS DateTime), N'AD00')
SET IDENTITY_INSERT [dbo].[DON_DAT_HANG] OFF
GO
INSERT [dbo].[DONDATHANG_MATHANG] ([MADDH], [MAMH], [SOLUONG], [DONGIA]) VALUES (12, N'MH005', 1, 400)
GO
SET IDENTITY_INSERT [dbo].[HOA_DON] ON 

INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (108, CAST(N'2022-01-06T23:28:10.210' AS DateTime), N'AD00', 1)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (109, CAST(N'2022-01-07T08:07:31.257' AS DateTime), N'AD00', 1)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (110, CAST(N'2022-01-07T08:53:17.577' AS DateTime), N'AD00', 1)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (111, CAST(N'2022-01-07T10:54:42.817' AS DateTime), N'AD00', 1)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1108, CAST(N'2022-01-07T14:08:55.390' AS DateTime), N'AD00', 1002)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1109, CAST(N'2022-01-07T15:06:31.410' AS DateTime), N'AD00', 1003)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1110, CAST(N'2022-01-07T15:06:51.533' AS DateTime), N'AD00', 2)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1111, CAST(N'2022-01-07T15:07:19.373' AS DateTime), N'AD00', 1002)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1112, CAST(N'2022-01-07T15:09:18.900' AS DateTime), N'AD00', 1002)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1113, CAST(N'2022-01-07T15:09:45.847' AS DateTime), N'AD00', 1002)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1114, CAST(N'2022-01-07T15:11:53.397' AS DateTime), N'AD00', 2)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1115, CAST(N'2022-01-07T15:44:32.210' AS DateTime), N'AD00', 1004)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1116, CAST(N'2022-01-07T21:20:17.423' AS DateTime), N'AD00', 1)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1117, CAST(N'2022-01-08T10:51:05.970' AS DateTime), N'AD00', 1004)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1118, CAST(N'2022-01-08T10:54:27.863' AS DateTime), N'AD00', 1005)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1119, CAST(N'2022-01-05T00:00:00.000' AS DateTime), N'AD00', 1002)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1120, CAST(N'2022-01-04T00:00:00.000' AS DateTime), N'AD00', 1002)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1121, CAST(N'2022-01-03T00:00:00.000' AS DateTime), N'AD00', 1005)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1122, CAST(N'2022-01-02T00:00:00.000' AS DateTime), N'AD00', 1005)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1123, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'AD00', 1003)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1124, CAST(N'2022-01-08T11:13:54.107' AS DateTime), N'AD00', 2)
INSERT [dbo].[HOA_DON] ([MAHOADON], [NGAYLAP], [MANHANVIEN], [MAKH]) VALUES (1125, CAST(N'2022-01-08T11:18:46.790' AS DateTime), N'AD00', 1005)
SET IDENTITY_INSERT [dbo].[HOA_DON] OFF
GO
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (108, N'MT002', 1, 499500)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (109, N'MH008', 1, 5000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (110, N'K0002', 1, 5000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (110, N'MH006', 1, 1000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (111, N'MH005', 4, 1600)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (111, N'MH007', 4, 8000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (111, N'MT001', 4, 1596000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'B0001', 1, 30000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MH001', 1, 3000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MH002', 2, 5000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MH003', 1, 3000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MH004', 1, 3500)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MH005', 1, 400)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MH006', 1, 1000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MH007', 2, 4000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MH009', 1, 400)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MT001', 1, 399000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'MT002', 2, 999000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'P0001', 1, 5000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'P0002', 1, 5500)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'P0003', 1, 5500)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'P0004', 1, 5000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1108, N'P0005', 1, 3500)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1109, N'K0002', 20, 100000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1109, N'MH006', 1, 1000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1110, N'K0002', 20, 100000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1110, N'MH006', 1, 1000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1110, N'MH008', 1, 5000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1111, N'K0001', 1, 5000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1111, N'MT001', 1, 399000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1111, N'P0002', 1, 5500)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1112, N'MH005', 1, 400)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1112, N'MH007', 1, 2000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1112, N'P0005', 1, 3500)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1113, N'K0001', 1, 5000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1113, N'MH006', 1, 1000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1114, N'B0001', 1, 30000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1114, N'MH006', 1, 1000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1114, N'MH008', 1, 5000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1114, N'MT002', 1, 499500)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1115, N'MH007', 20, 40000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1115, N'P0005', 54, 189000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1116, N'MT001', 51, 20349000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1117, N'MT001', 4, 1596000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1118, N'MT002', 20, 9990000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1119, N'MT002', 34, 16983000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1120, N'MT002', 52, 25974000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1121, N'MT002', 43, 21478500)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1122, N'MT002', 60, 29970000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1123, N'MT002', 54, 26973000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1124, N'K0001', 100, 500000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1124, N'P0002', 100, 550000)
INSERT [dbo].[HOADON_MATHANG] ([MAHD], [MAMH], [SOLUONGMUA], [THANHTIEN]) VALUES (1125, N'P0001', 1000, 5000000)
GO
SET IDENTITY_INSERT [dbo].[KHACH_HANG] ON 

INSERT [dbo].[KHACH_HANG] ([MAKH], [TENKH], [GIOITINH], [SDT], [VOHIEUHOA]) VALUES (1, N'Nguyễn Đức Hậu', N'Nam', N'0930007656', 0)
INSERT [dbo].[KHACH_HANG] ([MAKH], [TENKH], [GIOITINH], [SDT], [VOHIEUHOA]) VALUES (2, N'Nguyễn Phú Đức', N'Nam', N'0964732234', 0)
INSERT [dbo].[KHACH_HANG] ([MAKH], [TENKH], [GIOITINH], [SDT], [VOHIEUHOA]) VALUES (1002, N'Đỗ Thành Công', N'Nam', N'', 0)
INSERT [dbo].[KHACH_HANG] ([MAKH], [TENKH], [GIOITINH], [SDT], [VOHIEUHOA]) VALUES (1003, N'Nguyễn Tứ', N'Nam', N'0965783792', 0)
INSERT [dbo].[KHACH_HANG] ([MAKH], [TENKH], [GIOITINH], [SDT], [VOHIEUHOA]) VALUES (1004, N'Lê Cẩm Thúy', N'Nữ', N'', 0)
INSERT [dbo].[KHACH_HANG] ([MAKH], [TENKH], [GIOITINH], [SDT], [VOHIEUHOA]) VALUES (1005, N'Trần Thanh Thảo', N'Khác', N'', 0)
SET IDENTITY_INSERT [dbo].[KHACH_HANG] OFF
GO
INSERT [dbo].[LOAI_MAT_HANG] ([MALOAI], [TENLOAI], [VOHIEUHOA]) VALUES (N'BANG', N'BẢNG', 0)
INSERT [dbo].[LOAI_MAT_HANG] ([MALOAI], [TENLOAI], [VOHIEUHOA]) VALUES (N'BUT', N'BÚT', 1)
INSERT [dbo].[LOAI_MAT_HANG] ([MALOAI], [TENLOAI], [VOHIEUHOA]) VALUES (N'CAP', N'CẶP', 0)
INSERT [dbo].[LOAI_MAT_HANG] ([MALOAI], [TENLOAI], [VOHIEUHOA]) VALUES (N'GIAY', N'GIẤY', 1)
INSERT [dbo].[LOAI_MAT_HANG] ([MALOAI], [TENLOAI], [VOHIEUHOA]) VALUES (N'KEO', N'BĂNG KEO', 0)
INSERT [dbo].[LOAI_MAT_HANG] ([MALOAI], [TENLOAI], [VOHIEUHOA]) VALUES (N'MT', N'MÁY TÍNH', 0)
INSERT [dbo].[LOAI_MAT_HANG] ([MALOAI], [TENLOAI], [VOHIEUHOA]) VALUES (N'PHAN', N'PHẤN', 0)
INSERT [dbo].[LOAI_MAT_HANG] ([MALOAI], [TENLOAI], [VOHIEUHOA]) VALUES (N'THUOC', N'THƯỚC', 0)
GO
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'B0001', N'BÚT CHÌ MÁY', 30000, N'CÂY', N'BUT', N'Làm từ nhựa. Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'B0009', N'Bảng học sinh', 30000, N'Chiếc', N'BANG', N'', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'K0001', N'KEO TRẮNG', 5000, N'CHAI', N'KEO', N'Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'K0002', N'KEO VÀNG', 5000, N'CHAI', N'KEO', N'Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MH001', N'BÚT CHÌ', 3000, N'CÂY', N'BUT', N'Làm từ nhựa. Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MH002', N'BÚT BI', 2500, N'CÂY', N'BUT', N'Làm từ nhựa. Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MH003', N'THƯỚC ĐO ĐỘ', 3000, N'CÂY', N'THUOC', N'Làm từ nhựa. Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MH004', N'THƯỚC E-KE', 3500, N'CÂY', N'THUOC', N'Làm từ nhựa. Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MH005', N'GIẤY A4', 400, N'TỜ', N'GIAY', N'Làm từ gỗ', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MH006', N'GIẤY BAO TẬP', 1000, N'TỜ', N'GIAY', N'Làm từ nhựa. Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MH007', N'KEO HAI MẶT', 2000, N'CUỘN', N'KEO', N'Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MH008', N'KEO DÁN GIẤY', 5000, N'CHAI', N'KEO', N'Xuất xứ Việt Nam', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MH009', N'GIẤY A3', 400, N'TỜ', N'GIAY', N'Làm từ gỗ', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MT001', N'MÁY TÍNH CASIO FX-570VN PLUS', 399000, N'CÁI', N'MT', N'Máy tính sản xuất tại Thái Lan bởi Casio thương hiệu Trung Quốc', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'MT002', N'MÁY TÍNH CASIO FX-580VN PLUS', 499500, N'CÁI', N'MT', N'', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'P0001', N'PHẤN TRẮNG', 5000, N'Hộp', N'PHAN', N'', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'P0002', N'PHẤN ĐỎ', 5500, N'Hộp', N'PHAN', N'', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'P0003', N'PHẤN XANH', 5500, N'Hộp', N'PHAN', N'', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'P0004', N'PHẤN VÀNG', 5000, N'Hộp', N'PHAN', N'', 0)
INSERT [dbo].[MAT_HANG] ([MAMH], [TENMH], [GIABAN], [DVT], [MALOAI], [MOTA], [VOHIEUHOA]) VALUES (N'P0005', N'PHẤN LAM', 3500, N'Hộp', N'PHAN', N'', 0)
GO
INSERT [dbo].[NHA_CUNG_CAP] ([MANCC], [TENNCC], [DIACHI], [SDT], [EMAIL], [VOHIEUHOA]) VALUES (N'NCC01', N'THIÊN LONG', N'Hồ Chí Minh', N'0934567748', N'thienlongT4B@gmail.com', 0)
INSERT [dbo].[NHA_CUNG_CAP] ([MANCC], [TENNCC], [DIACHI], [SDT], [EMAIL], [VOHIEUHOA]) VALUES (N'NCC02', N'TRE VIỆT', N'Đồng Nai', N'0932567859', N'treviet59@gmail.com', 0)
INSERT [dbo].[NHA_CUNG_CAP] ([MANCC], [TENNCC], [DIACHI], [SDT], [EMAIL], [VOHIEUHOA]) VALUES (N'NCC03', N'BÌNH MINH', N'Đồng Nai', N'0932567859', N'binhminh@gmail.com', 0)
INSERT [dbo].[NHA_CUNG_CAP] ([MANCC], [TENNCC], [DIACHI], [SDT], [EMAIL], [VOHIEUHOA]) VALUES (N'NCC04', N'ĐẠI VIỆT', N'ĐỒNG THÁP', N'0976355344', N'', 0)
GO
INSERT [dbo].[NHAN_VIEN] ([MANHANVIEN], [TENNHANVIEN], [DIACHI], [SDT], [GIOITINH], [NGAYSINH], [CMND_CCCD], [TENDANGNHAP], [MATKHAU], [VOHIEUHOA], [LAQUANLY]) VALUES (N'AD00', N'Nguyễn Phú Đức', N'Bình Dương', N'0964732241', N'Nam', CAST(N'2001-07-31T00:00:00.000' AS DateTime), N'125874341', N'admin', N'admin12345', 0, 1)
INSERT [dbo].[NHAN_VIEN] ([MANHANVIEN], [TENNHANVIEN], [DIACHI], [SDT], [GIOITINH], [NGAYSINH], [CMND_CCCD], [TENDANGNHAP], [MATKHAU], [VOHIEUHOA], [LAQUANLY]) VALUES (N'NV01', N'Nguyễn Tứ', N'Khánh Hòa', N'0964732242', N'Nam', CAST(N'2001-02-18T00:00:00.000' AS DateTime), N'125874342', N'nguyentu', N'nguyentu', 0, 1)
INSERT [dbo].[NHAN_VIEN] ([MANHANVIEN], [TENNHANVIEN], [DIACHI], [SDT], [GIOITINH], [NGAYSINH], [CMND_CCCD], [TENDANGNHAP], [MATKHAU], [VOHIEUHOA], [LAQUANLY]) VALUES (N'NV02', N'Lê Cẩm Thúy', N'Đồng Tháp', N'0964732243', N'Nữ', CAST(N'2001-02-24T00:00:00.000' AS DateTime), N'125874343', N'camthuy', N'camthuy', 0, 1)
INSERT [dbo].[NHAN_VIEN] ([MANHANVIEN], [TENNHANVIEN], [DIACHI], [SDT], [GIOITINH], [NGAYSINH], [CMND_CCCD], [TENDANGNHAP], [MATKHAU], [VOHIEUHOA], [LAQUANLY]) VALUES (N'NV03', N'Trần Thanh Thảo', N'Tây Ninh', N'0964732244', N'Khác', CAST(N'2001-02-18T00:00:00.000' AS DateTime), N'125874344', N'thanhthao', N'', 0, 0)
INSERT [dbo].[NHAN_VIEN] ([MANHANVIEN], [TENNHANVIEN], [DIACHI], [SDT], [GIOITINH], [NGAYSINH], [CMND_CCCD], [TENDANGNHAP], [MATKHAU], [VOHIEUHOA], [LAQUANLY]) VALUES (N'NV04', N'Nguyễn Đức Hậu', N'Đồng Tháp', N'0964732245', N'Nam', CAST(N'2001-02-24T00:00:00.000' AS DateTime), N'125874345', N'duchau', N'duchau', 0, 0)
GO
ALTER TABLE [dbo].[DON_DAT_HANG]  WITH CHECK ADD  CONSTRAINT [FK_DON_DAT_HANG_NHA_CUNG_CAP] FOREIGN KEY([MANCC])
REFERENCES [dbo].[NHA_CUNG_CAP] ([MANCC])
GO
ALTER TABLE [dbo].[DON_DAT_HANG] CHECK CONSTRAINT [FK_DON_DAT_HANG_NHA_CUNG_CAP]
GO
ALTER TABLE [dbo].[DON_DAT_HANG]  WITH CHECK ADD  CONSTRAINT [FK_DON_DAT_HANG_NHAN_VIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NHAN_VIEN] ([MANHANVIEN])
GO
ALTER TABLE [dbo].[DON_DAT_HANG] CHECK CONSTRAINT [FK_DON_DAT_HANG_NHAN_VIEN]
GO
ALTER TABLE [dbo].[DONDATHANG_MATHANG]  WITH CHECK ADD  CONSTRAINT [FK__CT_DON_DA__MADDH__37A5467C] FOREIGN KEY([MADDH])
REFERENCES [dbo].[DON_DAT_HANG] ([MADDH])
GO
ALTER TABLE [dbo].[DONDATHANG_MATHANG] CHECK CONSTRAINT [FK__CT_DON_DA__MADDH__37A5467C]
GO
ALTER TABLE [dbo].[DONDATHANG_MATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_NHACUNGCAP_MAT_HANG] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MAT_HANG] ([MAMH])
GO
ALTER TABLE [dbo].[DONDATHANG_MATHANG] CHECK CONSTRAINT [FK_DONDATHANG_NHACUNGCAP_MAT_HANG]
GO
ALTER TABLE [dbo].[HOA_DON]  WITH CHECK ADD  CONSTRAINT [FK__HOA_DON__MANHANV__38996AB5] FOREIGN KEY([MANHANVIEN])
REFERENCES [dbo].[NHAN_VIEN] ([MANHANVIEN])
GO
ALTER TABLE [dbo].[HOA_DON] CHECK CONSTRAINT [FK__HOA_DON__MANHANV__38996AB5]
GO
ALTER TABLE [dbo].[HOA_DON]  WITH CHECK ADD  CONSTRAINT [FK_HOA_DON_KHACH_HANG] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACH_HANG] ([MAKH])
GO
ALTER TABLE [dbo].[HOA_DON] CHECK CONSTRAINT [FK_HOA_DON_KHACH_HANG]
GO
ALTER TABLE [dbo].[HOADON_MATHANG]  WITH CHECK ADD  CONSTRAINT [FK__CT_HOA_DON__MAMH__36B12243] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MAT_HANG] ([MAMH])
GO
ALTER TABLE [dbo].[HOADON_MATHANG] CHECK CONSTRAINT [FK__CT_HOA_DON__MAMH__36B12243]
GO
ALTER TABLE [dbo].[HOADON_MATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CT_HOA_DON_HOA_DON] FOREIGN KEY([MAHD])
REFERENCES [dbo].[HOA_DON] ([MAHOADON])
GO
ALTER TABLE [dbo].[HOADON_MATHANG] CHECK CONSTRAINT [FK_CT_HOA_DON_HOA_DON]
GO
ALTER TABLE [dbo].[MAT_HANG]  WITH CHECK ADD  CONSTRAINT [FK__MAT_HANG__MALOAI__3A81B327] FOREIGN KEY([MALOAI])
REFERENCES [dbo].[LOAI_MAT_HANG] ([MALOAI])
GO
ALTER TABLE [dbo].[MAT_HANG] CHECK CONSTRAINT [FK__MAT_HANG__MALOAI__3A81B327]
GO
/****** Object:  StoredProcedure [dbo].[BANHANG]    Script Date: 08/01/2022 11:36:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BANHANG]
(
	@TUNGAY DATETIME,
	@DENNGAY DATETIME
)
as
BEGIN
	SELECT    dbo.HOADON_MATHANG.SOLUONGMUA, dbo.HOADON_MATHANG.THANHTIEN, dbo.HOA_DON.NGAYLAP, dbo.KHACH_HANG.TENKH, dbo.MAT_HANG.TENMH, dbo.NHAN_VIEN.TENNHANVIEN, 
						  dbo.MAT_HANG.GIABAN, dbo.MAT_HANG.DVT
	FROM         dbo.HOA_DON INNER JOIN
						  dbo.HOADON_MATHANG ON dbo.HOA_DON.MAHOADON = dbo.HOADON_MATHANG.MAHD INNER JOIN
						  dbo.KHACH_HANG ON dbo.HOA_DON.MAKH = dbo.KHACH_HANG.MAKH INNER JOIN
						  dbo.MAT_HANG ON dbo.HOADON_MATHANG.MAMH = dbo.MAT_HANG.MAMH INNER JOIN
						  dbo.NHAN_VIEN ON dbo.HOA_DON.MANHANVIEN = dbo.NHAN_VIEN.MANHANVIEN
	WHERE dbo.HOA_DON.NGAYLAP >= CONVERT(datetime,@TUNGAY,103) AND dbo.HOA_DON.NGAYLAP <= dateadd(day, 1, CONVERT(datetime,@DENNGAY,103))
END
GO
/****** Object:  StoredProcedure [dbo].[DONDATHANG]    Script Date: 08/01/2022 11:36:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DONDATHANG]
(
	@TUNGAY DATETIME,
	@DENNGAY DATETIME
)
as
BEGIN
SELECT    dbo.DON_DAT_HANG.NGAYDAT, dbo.DONDATHANG_MATHANG.SOLUONG, dbo.MAT_HANG.GIABAN, dbo.MAT_HANG.TENMH, dbo.MAT_HANG.DVT, dbo.NHA_CUNG_CAP.TENNCC, 
                      dbo.NHAN_VIEN.TENNHANVIEN
FROM         dbo.DON_DAT_HANG INNER JOIN
                      dbo.DONDATHANG_MATHANG ON dbo.DON_DAT_HANG.MADDH = dbo.DONDATHANG_MATHANG.MADDH INNER JOIN
                      dbo.MAT_HANG ON dbo.DONDATHANG_MATHANG.MAMH = dbo.MAT_HANG.MAMH INNER JOIN
                      dbo.NHA_CUNG_CAP ON dbo.DON_DAT_HANG.MANCC = dbo.NHA_CUNG_CAP.MANCC INNER JOIN
                      dbo.NHAN_VIEN ON dbo.DON_DAT_HANG.MANV = dbo.NHAN_VIEN.MANHANVIEN
WHERE dbo.DON_DAT_HANG.NGAYDAT >= CONVERT(datetime,@TUNGAY,103) AND dbo.DON_DAT_HANG.NGAYDAT <= dateadd(day, 1, CONVERT(datetime,@DENNGAY,103))
END
GO
/****** Object:  StoredProcedure [dbo].[HOADON]    Script Date: 08/01/2022 11:36:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HOADON]
(
	@NGAY DATETIME
)
as
BEGIN
	SELECT    dbo.HOADON_MATHANG.SOLUONGMUA, dbo.HOADON_MATHANG.THANHTIEN, dbo.HOA_DON.NGAYLAP, dbo.KHACH_HANG.TENKH, dbo.KHACH_HANG.SDT, dbo.MAT_HANG.TENMH, dbo.NHAN_VIEN.TENNHANVIEN, 
						  dbo.MAT_HANG.GIABAN, dbo.MAT_HANG.DVT
	FROM         dbo.HOA_DON INNER JOIN
						  dbo.HOADON_MATHANG ON dbo.HOA_DON.MAHOADON = dbo.HOADON_MATHANG.MAHD INNER JOIN
						  dbo.KHACH_HANG ON dbo.HOA_DON.MAKH = dbo.KHACH_HANG.MAKH INNER JOIN
						  dbo.MAT_HANG ON dbo.HOADON_MATHANG.MAMH = dbo.MAT_HANG.MAMH INNER JOIN
						  dbo.NHAN_VIEN ON dbo.HOA_DON.MANHANVIEN = dbo.NHAN_VIEN.MANHANVIEN
	WHERE dbo.HOA_DON.NGAYLAP >= @NGAY
END
GO
/****** Object:  StoredProcedure [dbo].[KHACHHANG]    Script Date: 08/01/2022 11:36:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[KHACHHANG]
as
BEGIN
SELECT    TENKH, GIOITINH, VOHIEUHOA, SDT
FROM         dbo.KHACH_HANG
END
GO
/****** Object:  StoredProcedure [dbo].[MATHANG]    Script Date: 08/01/2022 11:36:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MATHANG]
as
BEGIN
	SELECT b.TENLOAI, a.MAMH, a.TENMH, a.GIABAN, a.DVT, a.MALOAI, a.MOTA, a.VOHIEUHOA
	FROM MAT_HANG a INNER JOIN LOAI_MAT_HANG b ON a.MALOAI = b.MALOAI
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MAT_HANG"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "LOAI_MAT_HANG"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [VANPHONGPHAM] SET  READ_WRITE 
GO
