create database finalproject;
use finalproject;

create table UserRole(
	id int not null auto_increment,
    roleName varchar(100) not null,
    primary key(id)
);

create table Users(
	id int not null auto_increment,
    roleID int not null,
    fullname varchar(100) not null,
    email varchar(100) not null,
    password varchar(100) not null,
	phone varchar(11) not null,
    avatar varchar(100) not null,
    primary key(id),
    foreign key(roleID) references UserRole(id)
);

create table Brands(
	id int not null auto_increment,
    brandName varchar(20),
    primary key(id)
);

create table Products(
	id int not null auto_increment,
    brandID int not null,
    productName varchar(100) not null,
    image varchar(100) not null,
    unitPrice float not null,
    discount float not null,
    description text not null,
    primary key(id),
    foreign key(brandID) references Brands(id)
);

create table ProductDetails(
	id int not null auto_increment,
    productID int not null,
    size int not null,
    quantity int not null,
    primary key(id),
    foreign key(productID) references Products(id)
);

create table Orders(
	id int not null auto_increment,
    userID int not null,
    total float not null,
    address varchar(200) not null,
    orderDate date not null,
    description text not null,
    status varchar(100) not null,
    primary key(id),
    foreign key(userID) references Users(id)
);

create table OrderDetails(
	id int not null auto_increment,
    orderID int not null,
    productDetailID int not null,
    size int not null,
    quantity int not null,
    unitPrice float not null,
    discount float not null,
    primary key(id),
    foreign key(orderID) references Orders(id),
    foreign key(productDetailID) references ProductDetails(id)
);

-- insert value
-- table UserRole
insert into UserRole(roleName) values('Admin');
insert into UserRole(roleName) values('Nhân viên bán hàng');
insert into UserRole(roleName) values('Nhân viên quản lý kho');
insert into UserRole(roleName) values('Khách hàng');

-- table Users
insert into Users(roleID, fullname, email, password, phone, avatar) values(1, 'admin', 'admin@gmail.com', '$2a$12$z/1klZXahtSmCBaZ406jgewK.8XEcnT8Dc.g57l7QRXuKdSeThxs6', '0912345678', 'admin.png');

-- table Brands
insert into Brands(brandName) values('Nike');
insert into Brands(brandName) values('Adidas');
insert into Brands(brandName) values('Puma');
insert into Brands(brandName) values('Converse');

-- table Products
-- Nike
insert into Products(brandID, productName, image, unitPrice, discount, description) values(1, 'Nike Air Force 1', 'item1.png', 4150000, 0.0, 'Giày Nike Air Force 1 được đánh giá là một trong những mẫu Sneaker đình đám nhất và điển hình nhất trong danh mục những đôi giày thể thao thời trang của giới trẻ.\nMẫu giày Nike Air Force 1 thực sự cân bằng được phong cách thời trang với kết hợp dễ dàng dành cho những bộ trang phục thông thường cho cả nam và nữ như quần jeans, short hay những kiểu áo yếm tinh nghịch thậm chí là những chiếc váy ngắn. Mẫu giày Nike Air Force 1 với cổ cao trên mắt cá chân thường được các bạn nam kết hợp cùng với những mẫu quần jeans sắn gấu.');
insert into Products(brandID, productName, image, unitPrice, discount, description) values(1, 'Nike Air Jordan 1', 'item2.png', 4200000, 0.1, 'Được xem như một thước đo trong giới “chơi” sneaker hiện tại, Air Jordan 1 trở thành chuẩn mực và cũng là niềm mơ ước sở hữu của hầu hết các sneakerhead bởi giá trị lịch sử gắn liền với hình bóng người đàn ông với cú dunk huyền thoại – Michael Jordan.');
insert into Products(brandID, productName, image, unitPrice, discount, description) values(1, 'Nike VaporMax ACE', 'item3.png', 5270000, 0.3, 'Nike Air VaporMax được đánh giá là phiên bản đột phá nhất của dòng giày Air Max của Nike. Air VaporMax ra đời đã tạo ra “bước ngoặt” ấn tượng trong công nghệ: loại bỏ hoàn toàn những thanh chống bằng nhựa TPU phía bên trong phần Air, phần upper được làm hoàn toàn bằng chất liệu Flyknit đi cùng với bộ đệm bong bóng khí mới lạ.\nĐây cũng là đôi giày được coi là đối thủ của Ultra Boost khi xét về độ êm ái của Air mang đến so với các hạt Boost. Nhưng về khoản Fashion thì chắc hẳn cần chút tinh tế để chúng ta có thể mix VaporMax được hợp nhất đấy.');

-- Adidas
insert into Products(brandID, productName, image, unitPrice, discount, description) values(2, 'Adidas Ultra Boost', 'item4.png', 5300000, 0.0, 'Một cú sốc lớn từ Adidas VN mang tên Ultra Boost, trở thành đôi giày tốt nhất trong lịch sử 70 năm của Adidas. Siêu phẩm giày chạy bộ này vừa mới ra mắt đã được giới thời trang và thể thao chạy bộ săn đón, từ năm 2015 đến nay vẫn còn hot và vẫn chưa có dấu hiệu hạ nhiệt . Thiết kế cứng cáp, chắc chắn nhưng không hề thừa là ấn tượng đầu tiên về Ultra BOOST. Đây cũng là phong cách thiết kế tối giản đẹp nhất được ưa chuộng trong làng mốt. Không chỉ là giày chạy bộ, Ultra BOOST còn có thể coi là một đôi giày thể thao hoàn hảo, dễ dàng phối với các phong cách đường phố khác nhau. Luôn làm hài lòng quý khách về mặt thời trang và chất lượng. Đế được cấu tạo bởi hàng nghìn viên EVA năng lượng để duy trì phản hồi năng lượng ổn định.Thân giày được tạo nên từ công nghệ dệt PRIMEKNIT, giúp ôm gọn và thích ứng với từng chuyển động của chân. Đế giày với thiết kế Stretch Web kéo dài từ mũi đến gót giày gia tăng độ thích nghi với mặt tiếp xúc và co giãn theo chuyển động chân.');
insert into Products(brandID, productName, image, unitPrice, discount, description) values(2, 'Adidas Yeezy', 'item5.png', 7250000, 0.3, 'Khi dòng giày boost Yeezy 350 này ra đời, cả thế giới đã phát cuồng vì nó. Một đôi giày gây sốt kinh hoàng. Đôi giày rất đặc biệt, thiết kế đơn giản nhưng không hề đơn điệu, phong cách đường phố, chất liệu cực nhẹ, đế cực mềm, màu sắc hợp xu hướng cao cấp khiến nhiều bạn mê mẩn ngay từ cái nhìn đầu tiên. Fan cuồng giày sneaker nam. Nếu bạn là một tín đồ thời trang đường phố thì bạn sẽ hiểu được tầm ảnh hưởng của đôi giày này. Sẽ càng hot hơn khi có thêm nhiều phối màu và phiên bản cực độc và đẹp khác. Hiện nay nó đang ngày càng được nhiều người biết đến, khi yeezy có một phiên bản mới cực kỳ hay ho đó chính là Yeezy 350 boost V2 siêu hot. Về cơ bản, sản phẩm vẫn giữ nguyên kiểu dáng giày ban đầu, nhưng sự thay đổi nằm ở cách phối màu độc đáo hơn. Khi mới ra mắt, phần trên của 350 V2 vẫn được làm bằng Primeknit với hai màu xám / đen. Điểm nhấn là đường sọc màu cam kéo dài từ gót đến giữa giày. Tôi tin rằng đôi giày Yezzy V2 này sẽ không bị cản trở trong thời gian sắp tới.');
insert into Products(brandID, productName, image, unitPrice, discount, description) values(2, 'Adidas Stansmith', 'item6.png', 3450000, 0.0, 'Stansmith thực chất là một đôi giày quần vợt, được đặt theo tên của một vận động viên quần vợt nổi tiếng người Mỹ. Tuy nhiên, nhờ thiết kế đơn giản, toàn bộ đôi giày chủ yếu là màu trắng và sự phối hợp màu sắc được nhận biết, với hình vẽ phác họa Stansmith trên lưỡi gà, Stan Smith đã nhanh chóng trở thành một hiện tượng vào thời điểm mới “khai sinh” đến tận bây giờ. Nó được mọi người yêu thích bởi tính đa dụng, dễ đi lại, dễ phối đồ và phối nhiều phong cách khác nhau. Trải qua bao thăng trầm, biến đổi thời trang và phong cách thiết kế sneaker bắt kịp thời đại, Stan Smith đã vượt qua thử thách của thời gian và trở thành một trong những đôi giày đơn giản và đẹp nhất từng được thiết kế. Một đôi giày bền bỉ, mang vẻ đẹp cổ điển, tinh tế và thanh lịch.');

-- Puma
insert into Products(brandID, productName, image, unitPrice, discount, description) values(3, 'Puma Fenty Creeper', 'item7.png', 3150000, 0.0, 'Việc nhanh chóng “cháy hàng” chỉ sau 3 giờ đầu mở bán và số lượng người mua khổng lồ đánh sập cả trang web của Puma. Cộng thêm sự xuất hiện tràn lan gây “bão” diện rộng trên các mạng xã hội đã cho thấy sức hút của đôi giày Puma này “khủng” như thế nào. Thế mới biết được vì sao những đôi Puma Creeper lại phổ biến và được đông đảo bạn trẻ việt nam yêu thích như vậy.\nSức nóng của giày Puma Fenty Creeper không chỉ ảnh hưởng đến giới trẻ. Mà item này còn là đôi giày yêu thích của hàng loạt ngôi sao đình đám như Cara Delevingne, Gigi Hadid, Bella Hadid, v.v…những ngôi sao đình đám trong làng giải trí. Chính điều nào cũng tạo nên một làn sóng lan tỏa mãnh liệt đến từng fan hâm mộ.');
insert into Products(brandID, productName, image, unitPrice, discount, description) values(3, 'Puma Ember Trail', 'item8.png', 4230000, 0.1, 'Đây là một trong những sản phẩm đánh dấu xu hướng của năm 2020 với kiểu đế chunky hầm hố. Đôi giày được thiết kế kiểu dáng chắc chắn và phối màu cực kỳ nổi bật.\nPhần trên của giày được làm bằng vải dệt kết hợp với lớp lưới mang lại cảm giác mịn màng tối đa. Lớp lót Misole eva kết hợp công nghệ Formstrip để bảo vệ bàn chân một cách hoàn hảo. Đây là một trong những thế mạnh của Puma khiến người dùng cảm thấy hài lòng và yêu thích. Đế giày được làm bằng cao su với các rãnh chống trượt để tăng tính linh hoạt khi di chuyển nhìn cực kỳ khỏe khoắn và cá tính. Đôi giày này dùng để đi học, đi làm hay chơi thể thao thì tuyệt cú mèo rồi.');
insert into Products(brandID, productName, image, unitPrice, discount, description) values(3, 'Puma Ignite Evoknit', 'item9.png', 3750000, 0.2, 'Để bắt kịp xu hướng và tiếp tục chạy đường dài với Asics, New Balance, Mizuno hay adidas trong lĩnh vực chạy bộ. Puma đã giới thiệu công nghệ Ignite đến giới thời trang và nhanh chóng cho ra mắt dòng giày Puma Ignite Evoknit.\nVới mong muốn mang đến cho người tiêu dùng một đôi giày chạy bộ có thể ôm chân như đi tất. Cổ giày được thiết kế có độ đàn hồi cao như tất, có dây buộc chắc chắn giúp cố định gót chân. Với chất liệu Ignite mới này, tôi tin rằng bạn sẽ có những trải nghiệm vô cùng thú vị khi mang giày Puma. Đây là mẫu giày đầu tiên được chế tạo bằng công nghệ mới này. Puma Ignite Evoknit đã thu hút được sự chú ý rộng rãi và đạt được thành công ngoài mong đợi.');

-- Converse
insert into Products(brandID, productName, image, unitPrice, discount, description) values(4, 'Converse Chuck Taylor All Star', 'item10.png', 1350000, 0.3, 'Chắc chắn các bạn đều đã quá quen thuộc với đôi giày huyền thoại này rồi, giày All Star là một trong các dòng Converse đầu tiên mang phong cách cổ điển của hãng. Có thể nhận biết All Star dễ dàng thông qua phù hiệu Converse All Star và chữ ký của Chuck Taylor ở mắt cá chân.\nCho đến nay Chuck Taylor All Star đã trở thành biểu tượng bất diệt trong làng giày thể thao, khi nhắc đến Chuck Taylor (tên vận động viên bóng rổ nổi tiếng người Mỹ) mọi người sẽ nghĩ ngay đến Converse.');
insert into Products(brandID, productName, image, unitPrice, discount, description) values(4, 'Converse One Star', 'item11.png', 1650000, 0.2, 'Giày được thiết kế những năm 70s bởi Jim Labadini và chủ yếu là dành cho nam giới với thiết kế mạnh mẽ, khỏe khoắn. Tuy nhiên thì những năm gần đây, Converse đã cho ra mắt các cách phối màu độc lạ, trẻ trung phù hợp với các bạn nữ hơn.\nĐiểm đặc biệt giúp bạn nhận ra One Star dễ dàng chính là ngôi sao lớn nằm ngay trên mặt giày. Ngoài ra, trong một số bộ sưu tập còn có hình hoa hướng dương được in bên trong lót giày mang đến sự độc đáo, mới mẻ và thu hút sự chú ý của nhiều bạn trẻ.');
insert into Products(brandID, productName, image, unitPrice, discount, description) values(4, 'Converse Jack Purcell', 'item12.png', 1250000, 0.0, 'Converse Jack Purcell được thiết kế dựa trên form giày Converse Classic kinh điển dành riêng cho những người chơi môn cầu lông và đặc biệt cái tên này xuất phát từ một danh thủ vô địch bộ môn cầu lông lúc bấy giờ.\nCó thể dễ dàng nhận thấy sự khác biệt trong thiết kế của Jack Purcell với lưỡi gà hình cánh chim, phần thân được sử dụng chất liệu vải cao cấp và đắp thêm một lớp cao su ở mũi giày để tăng khả năng sử dụng. Đặc biệt, ở mũi giày của Converse Jack Purcell có hình vòng cung bo tròn trông rất giống hình mặt cười – một điểm nhấn đầy thú vị cho những tín đồ yêu thích giày Converse.');


-- table ProductDetails
-- Nike
insert into ProductDetails(productID, size, quantity) values(1, 39, 100);
insert into ProductDetails(productID, size, quantity) values(1, 40, 80);
insert into ProductDetails(productID, size, quantity) values(1, 41, 70);
insert into ProductDetails(productID, size, quantity) values(1, 42, 200);
insert into ProductDetails(productID, size, quantity) values(1, 43, 90);

insert into ProductDetails(productID, size, quantity) values(2, 39, 120);
insert into ProductDetails(productID, size, quantity) values(2, 40, 80);
insert into ProductDetails(productID, size, quantity) values(2, 41, 60);
insert into ProductDetails(productID, size, quantity) values(2, 42, 180);
insert into ProductDetails(productID, size, quantity) values(2, 43, 70);

insert into ProductDetails(productID, size, quantity) values(3, 39, 110);
insert into ProductDetails(productID, size, quantity) values(3, 40, 70);
insert into ProductDetails(productID, size, quantity) values(3, 41, 30);
insert into ProductDetails(productID, size, quantity) values(3, 42, 280);
insert into ProductDetails(productID, size, quantity) values(3, 43, 220);

-- Adidas
insert into ProductDetails(productID, size, quantity) values(4, 39, 80);
insert into ProductDetails(productID, size, quantity) values(4, 40, 230);
insert into ProductDetails(productID, size, quantity) values(4, 41, 70);
insert into ProductDetails(productID, size, quantity) values(4, 42, 210);
insert into ProductDetails(productID, size, quantity) values(4, 43, 190);

insert into ProductDetails(productID, size, quantity) values(5, 39, 70);
insert into ProductDetails(productID, size, quantity) values(5, 40, 40);
insert into ProductDetails(productID, size, quantity) values(5, 41, 80);
insert into ProductDetails(productID, size, quantity) values(5, 42, 190);
insert into ProductDetails(productID, size, quantity) values(5, 43, 170);

insert into ProductDetails(productID, size, quantity) values(6, 39, 120);
insert into ProductDetails(productID, size, quantity) values(6, 40, 40);
insert into ProductDetails(productID, size, quantity) values(6, 41, 90);
insert into ProductDetails(productID, size, quantity) values(6, 42, 230);
insert into ProductDetails(productID, size, quantity) values(6, 43, 120);

-- Puma
insert into ProductDetails(productID, size, quantity) values(7, 39, 60);
insert into ProductDetails(productID, size, quantity) values(7, 40, 250);
insert into ProductDetails(productID, size, quantity) values(7, 41, 90);
insert into ProductDetails(productID, size, quantity) values(7, 42, 220);
insert into ProductDetails(productID, size, quantity) values(7, 43, 140);

insert into ProductDetails(productID, size, quantity) values(8, 39, 170);
insert into ProductDetails(productID, size, quantity) values(8, 40, 140);
insert into ProductDetails(productID, size, quantity) values(8, 41, 280);
insert into ProductDetails(productID, size, quantity) values(8, 42, 140);
insert into ProductDetails(productID, size, quantity) values(8, 43, 70);

insert into ProductDetails(productID, size, quantity) values(9, 39, 150);
insert into ProductDetails(productID, size, quantity) values(9, 40, 90);
insert into ProductDetails(productID, size, quantity) values(9, 41, 100);
insert into ProductDetails(productID, size, quantity) values(9, 42, 220);
insert into ProductDetails(productID, size, quantity) values(9, 43, 120);

-- Converse
insert into ProductDetails(productID, size, quantity) values(10, 39, 80);
insert into ProductDetails(productID, size, quantity) values(10, 40, 200);
insert into ProductDetails(productID, size, quantity) values(10, 41, 190);
insert into ProductDetails(productID, size, quantity) values(10, 42, 290);
insert into ProductDetails(productID, size, quantity) values(10, 43, 170);

insert into ProductDetails(productID, size, quantity) values(11, 39, 180);
insert into ProductDetails(productID, size, quantity) values(11, 40, 120);
insert into ProductDetails(productID, size, quantity) values(11, 41, 180);
insert into ProductDetails(productID, size, quantity) values(11, 42, 170);
insert into ProductDetails(productID, size, quantity) values(11, 43, 90);

insert into ProductDetails(productID, size, quantity) values(12, 39, 200);
insert into ProductDetails(productID, size, quantity) values(12, 40, 190);
insert into ProductDetails(productID, size, quantity) values(12, 41, 120);
insert into ProductDetails(productID, size, quantity) values(12, 42, 80);
insert into ProductDetails(productID, size, quantity) values(12, 43, 160);
