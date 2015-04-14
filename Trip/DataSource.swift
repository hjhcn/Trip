//
//  DataSource.swift
//  Trip
//
//  Created by haojunhua on 15/4/12.
//  Copyright (c) 2015年 kidsedu. All rights reserved.
//

import Foundation

class DataSource : NSObject {
    
    let JQDatas = [
        JQ(id: 1, name: "故宫", picPath: "gugong.jpg", audioPath: "gugong.m4a", detailDesc: "北京故宫，旧称为紫禁城。位于北京中轴线的中心，是明、清两代的皇宫，占地面积约为72万平方米，建筑面积约为15万平方米，是世界上现存规模最大、保存最为完整的木质结构的宫殿型建筑。", location: CLLocationCoordinate2D(latitude: 39.91718775,longitude: 116.39706194),phone:"010-65132255",address:"北京市景山前街4号",price:60),
        JQ(id: 2, name: "天坛公园", picPath: "ttgy.jpg", audioPath: "", detailDesc: "天坛，在北京市南部，东城区永定门内大街东侧。占地约273万平方米。天坛始建于明永乐十八年（1420年），清乾隆、光绪时曾重修改建。为明、清两代帝王祭祀皇天、祈五谷丰登之场所。天坛是圜丘、祈谷两坛的总称，有坛墙两重，形成内外坛，坛墙南方北圆，象征天圆地方。主要建筑在内坛，圜丘坛在南、祈谷坛在北，二坛同在一条南北轴线上，中间有墙相隔。圜丘坛内主要建筑有圜丘坛、皇穹宇等等，祈谷坛内主要建筑有祈年殿、皇乾殿、祈年门等。", location: CLLocationCoordinate2D(latitude: 39.880,longitude: 116.411),phone:"010-67028866",address:"北京市东城区天坛内东里7号",price:35)
    ]
    
    let JDDatas = [
        JD(id: 1, name: "天安门", picPath: "tam.jpg", audioPath: "gugong.m4a", detailDesc: "中华人民共和国的象征。坐落在中华人民共和国首都——北京市的中心、故宫的南端，与天安门广场隔长安街相望。是明清两代北京皇城的正门。设计者为明代御用建筑匠师蒯祥。城台下有券门五阙，中间的券门最大，位于北京皇城中轴线上，过去只有皇帝才可以由此出入。正中门洞上方悬挂着巨大的毛泽东主席画像，两边分别是“中华人民共和国万岁”和“世界人民大团结万岁”的大幅标语。始建于明朝永乐十五年（公元1417年），最初名叫“承天门”，寓“承天启运、受命于天”之意，是紫禁城的正门。清朝顺治八年（公元1651年）更名为天安门。既包含了皇帝是替天行使权力、理应万世至尊的意旨；又寓有“外安内和、长治久安”的含义。1925年10月10日，故宫博物院成立，天安门开始对民众开放。1949年10月1日，在这里举行了中华人民共和国开国大典，它由此被设计入国徽，并成为中华人民共和国的象征。天安门被中华人民共和国国务院公布为第一批全国重点文物保护单位之一。它以其500多年厚重的历史内涵，高度浓缩了中华古代文明与现代文明，成为举世瞩目、令人神往的地方。", location:CLLocationCoordinate2D(latitude: 39.9085,longitude: 116.3975) ),
        JD(id: 2, name: "故宫博物馆", picPath: "bwy.jpg", audioPath: "gugong.m4a", detailDesc: "北京故宫博物院建立于1925年10月10日，位于北京故宫紫禁城内。是在明朝、清朝两代皇宫及其收藏的基础上建立起来的中国综合性博物馆，也是中国最大的古代文化艺术博物馆，其文物收藏主要来源于清代宫中旧藏，是第一批全国爱国主义教育示范基地。北京故宫博物院位于北京故宫即紫禁城内。北京故宫是第一批全国重点文物保护单位、第一批国家5A级旅游景区，1987年入选《世界文化遗产名录》。", location: CLLocationCoordinate2D(latitude: 39.917,longitude: 116.397))
    ]
    
    let FWDatas = [
        FW(id: 1, name: "洗手间", picPath: "ggcs.jpg", detailDesc: "洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间洗手间", location: CLLocationCoordinate2D(latitude: 39.920,longitude: 116.393)),
        FW(id: 2, name: "服务站", picPath: "jszx.jpg", detailDesc: "服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站服务站", location:CLLocationCoordinate2D(latitude: 39.9185,longitude: 116.3975))
    ]
}