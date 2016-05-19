package com.ssic.cookbook.manager.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssic.cookbook.admin.util.Const;
import com.ssic.cookbook.manager.dao.CategoryDao;
import com.ssic.cookbook.manager.dao.ColorDao;
import com.ssic.cookbook.manager.dao.CuisineDao;
import com.ssic.cookbook.manager.dao.FixingsMasterDao;
import com.ssic.cookbook.manager.dao.IntelligentFixingsDao;
import com.ssic.cookbook.manager.dao.NutritionDao;
import com.ssic.cookbook.manager.dao.ShapeDao;
import com.ssic.cookbook.manager.dao.StyleDao;
import com.ssic.cookbook.manager.dao.TasteDao;
import com.ssic.cookbook.manager.dto.CategoryDto;
import com.ssic.cookbook.manager.dto.ColorDto;
import com.ssic.cookbook.manager.dto.CuisineDto;
import com.ssic.cookbook.manager.dto.FixingsMasterDto;
import com.ssic.cookbook.manager.dto.FixingsResultDto;
import com.ssic.cookbook.manager.dto.IntelligentFixingsDto;
import com.ssic.cookbook.manager.dto.ShapeDto;
import com.ssic.cookbook.manager.dto.SmartNutritionDto;
import com.ssic.cookbook.manager.dto.StyleDto;
import com.ssic.cookbook.manager.dto.TasteDto;
import com.ssic.cookbook.manager.pojo.IntelligentFixings;
import com.ssic.cookbook.manager.pojo.IntelligentFixingsCategory;
import com.ssic.cookbook.manager.pojo.IntelligentFixingsColor;
import com.ssic.cookbook.manager.pojo.IntelligentFixingsCuisine;
import com.ssic.cookbook.manager.pojo.IntelligentFixingsNutrition;
import com.ssic.cookbook.manager.pojo.IntelligentFixingsShape;
import com.ssic.cookbook.manager.pojo.IntelligentFixingsStyle;
import com.ssic.cookbook.manager.pojo.IntelligentFixingsTaste;
import com.ssic.cookbook.manager.service.IIntelligentFixingsService;
import com.ssic.cookbook.manager.util.BeanUtils;
import com.sun.xml.internal.ws.util.StringUtils;
@Service
public class CopyOfIntelligentFixingsServiceImpl implements IIntelligentFixingsService
{       
        @Autowired
        private IntelligentFixingsDao intelligentFixingsDao;
        
        @Autowired
        private FixingsMasterDao fixingsMasterDao;
        
        @Autowired
        private NutritionDao nutritionDao;
        
        @Autowired
        private CategoryDao categoryDao;
        
        @Autowired
        private StyleDao styleDao;
        
        @Autowired
        private ShapeDao shapeDao;
        
        @Autowired
        private TasteDao tasteDao;
        
        @Autowired
        private CuisineDao cuisineDao;
        
        @Autowired
        private ColorDao colorDao;
        

        @Cacheable(value = "default", key = "'cookbook.manager.dto.IntelligentFixingsDtoList'")
        public List<FixingsResultDto> findAllIntelligentProduct(FixingsResultDto fdto)
        {
            // TODO 添加方法注释
            List<FixingsResultDto> list=   intelligentFixingsDao.findAllIntelligentProduct(fdto);
            if(list==null){
                return list;
            }
            return list;
        }

        
        @Cacheable(value = "default", key = "'cookbook.manager.dto.IntelligentFixingsDtoList'")
        public List<FixingsResultDto> findAllIntelligentProductType()
        {
            // TODO 添加方法注释
            return intelligentFixingsDao.findAllIntelligentProductType();
        }
        @Cacheable(value = "default", key = "'cookbook.manager.dto.IntelligentFixingsDtoList'")
        public List<FixingsResultDto> findAllIntelligentProductName()
        {
            // TODO 添加方法注释
            return intelligentFixingsDao.findAllIntelligentProductName();
        }

        public int findCount()
        {
            // TODO 添加方法注释
            return intelligentFixingsDao.findCount();
        }



    
        
        /**
		 * @author YIn
		 * @time:2015年12月31日 上午9:29:30
		 */
        @Transactional
		public String addSmart(IntelligentFixingsDto dto) {
        	//配菜主表插数据
        	FixingsMasterDto masterdto = new FixingsMasterDto();
        	masterdto.setId(UUID.randomUUID()+"");
        	masterdto.setFixingsName(dto.getFixingsName());
        	masterdto.setFixingsType(2); //智能配菜
        	boolean masterFlag = fixingsMasterDao.add(masterdto);
        	if(masterFlag != true){
        		return Const.FALSE;
        	}
        	
        	//向智能配菜表插数据
        	boolean smartFlag = false;
        	dto.setId(UUID.randomUUID()+"");
        	dto.setFixingsMasterId(masterdto.getId());
			IntelligentFixings smart = new IntelligentFixings();
			BeanUtils.copyProperties(dto, smart);
			smartFlag = intelligentFixingsDao.addSmart(smart);
			//intelligentFixingsDao.insertSelective(smart);
			if(smartFlag != true){
				return Const.FALSE;
        	}
			
        	//向智能配菜类别关系表插数据
        	for(int i=0;i<dto.getCategoryId().length;i++){
        		CategoryDto c = new CategoryDto();
        		c.setIntelligentFixingsId(dto.getId());
        		c.setCategoryId(dto.getCategoryId()[i]);
        		c.setCategoryCount(Long.parseLong(dto.getCategoryCount()[i]));
        		boolean stat = categoryDao.add(c);
        		if(stat == false){
        			return Const.FALSE;
        			
        		}
        	}
        	
        	//向智能配菜菜系关系表插数据
        	for(int i=0;i<dto.getStyleId().length;i++){
        		StyleDto s = new StyleDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setStyleId(dto.getStyleId()[i]);
        		boolean stat = styleDao.add(s);
        		if(stat == false){
        			return Const.FALSE;
        			
        		}
        	}
             
        	//向智能配菜形状关系表插数据
        	for(int i=0;i<dto.getShapeId().length;i++){
        		ShapeDto s = new ShapeDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setShapeId(dto.getShapeId()[i]);
        		boolean stat = shapeDao.add(s);
        		if(stat == false){
        			return Const.FALSE;
        			
        		}
        	}
        	
        	//向智能配菜口味关系表插数据
        	for(int i=0;i<dto.getTasteId().length;i++){
        		TasteDto s = new TasteDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setTasteId(dto.getTasteId()[i]);
        		boolean stat = tasteDao.add(s);
        		if(stat == false){
        			return Const.FALSE;
        			
        		}
        	}
        	
        	//向智能配菜烹饪关系表插数据
        	for(int i=0;i<dto.getCuisineId().length;i++){
        		CuisineDto s = new CuisineDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setCuisineId(dto.getCuisineId()[i]);
        		boolean stat = cuisineDao.add(s);
        		if(stat == false){
        			return Const.FALSE;
        			
        		}
        	}
        	
        	//向智能配菜颜色关系表插数据
        	for(int i=0;i<dto.getColorId().length;i++){
        		ColorDto s = new ColorDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setColorId(dto.getColorId()[i]);
        		boolean stat = colorDao.add(s);
        		if(stat == false){
        			return Const.FALSE;
        			
        		}
        	}
        	
        	//向智能配菜营养关系表插数据
        	for(int i=0;i<dto.getNutritionId().length;i++){
        		SmartNutritionDto n = new SmartNutritionDto();
        		n.setIntelligentFixingsId(dto.getId());
        		n.setNutritionId(dto.getNutritionId()[i]);
        		n.setNutritionContent(Long.parseLong(dto.getNutritionContent()[i]));
        		n.setNutritionOperator(dto.getNutritionOperator()[i]);
        		boolean stat = nutritionDao.add(n);
        		if(stat == false){
        			return Const.FALSE;
        			
        		}
        	}
			return dto.getId();
		}

        /**
		 * @author YIn
		 * @time:2016年1月4日 上午9:51:19
		 */
		public List<IntelligentFixingsDto> findSmart(IntelligentFixingsDto dto) {
			//设置查询条件
			dto.setStat(1);   //有效
			dto.setFixingsType(2);   //2为智能配菜
			List<IntelligentFixingsDto> result = intelligentFixingsDao.findIntelligentFixings(dto);
			/*for(int i = 0;i < result.size();i++){
				String id = result.get(i).getId();
				if(id != null && !id.equals("")){
				List<IntelligentFixingsCategory> categoryList = categoryDao.findCategory(id);
				List<CategoryDto> categoryDtoList= BeanUtils.createBeanListByTarget(categoryList, CategoryDto.class);
				result.get(i).setCategory(categoryDtoList);
				
				List<IntelligentFixingsNutrition> nutritionList = nutritionDao.findNutrition(id);
				List<SmartNutritionDto> nutritionDtoList= BeanUtils.createBeanListByTarget(nutritionList, SmartNutritionDto.class);
				result.get(i).setNutrition(nutritionDtoList);
				}
				
				List<IntelligentFixingsStyle> styleList = styleDao.findStyle(id);
				List<StyleDto> styleDtoList= BeanUtils.createBeanListByTarget(styleList, StyleDto.class);
				result.get(i).setStyle(styleDtoList);
				
				List<IntelligentFixingsShape> shapeList = shapeDao.findShape(id);
				List<ShapeDto> shapeDtoList= BeanUtils.createBeanListByTarget(shapeList, ShapeDto.class);
				result.get(i).setShape(shapeDtoList);
				
				List<IntelligentFixingsTaste> tasteList = tasteDao.findTaste(id);
				List<TasteDto> tasteDtoList= BeanUtils.createBeanListByTarget(tasteList, TasteDto.class);
				result.get(i).setTaste(tasteDtoList);
				
				List<IntelligentFixingsCuisine> cuisineList = cuisineDao.findCuisine(id);
				List<CuisineDto> cuisineDtoList= BeanUtils.createBeanListByTarget(cuisineList, CuisineDto.class);
				result.get(i).setCuisine(cuisineDtoList);
				
				List<IntelligentFixingsColor> colorList = colorDao.findColor(id);
				List<ColorDto> colorDtoList= BeanUtils.createBeanListByTarget(colorList, ColorDto.class);
				result.get(i).setColor(colorDtoList);
			}
			return result;*/
			
			//把结果查出来放到map中减少查询次数,提高查询性能
			List<CategoryDto> categoryList = categoryDao.findCategory("");
			Map<String, List<IntelligentFixingsCategory>> categoryMap =new HashMap<String, List<IntelligentFixingsCategory>>();
			List<IntelligentFixingsCategory> categoryList_ = null;
			for(CategoryDto category:categoryList){
				if(categoryMap.containsKey(category.getIntelligentFixingsId())){
					categoryList_ = categoryMap.get(category.getIntelligentFixingsId());
					categoryList_.add(category);
				}else{
					categoryList_ = new ArrayList<IntelligentFixingsCategory>();
					categoryList_.add(category);
				}
				categoryMap.put(category.getIntelligentFixingsId(), categoryList_);
			}
			
			for(IntelligentFixingsDto smart : result){
				smart.setCategory(categoryMap.get(smart.getId());
//				for(String k:categoryMap.keySet()){
//		            //System.out.println(k+":"+categoryMap.get(k));
//					if(smart.getId().equals(k)){
//						smart.setCategory(categoryMap.get(k));
//					}
//		        }
			}
			
			//Map:<1,<1,2,3,4>>;<1,<1,7,8,9>>;<2,<2,2,3,4>>;<3,<3,2,3,4>>;  id相同的情况
			
			/* * 第一次:categoryList_ : <1,2,3,4>
				    categoryMap	  : <1,<1,2,3,4>>
			         第二次   categoryList_ : <1,2,3,4>  <1,7,8,9>
				    categoryMap	  : <1,<1,2,3,4><1,7,8,9>>
			         第三次   categoryList_ : <2,2,3,4>
				    categoryMap	  : <1,<1,2,3,4><1,7,8,9>; 2,<2,2,3,4>>    
			         第四次   categoryList_ : <3,2,3,4>
				    categoryMap	  : <1,<1,2,3,4><1,7,8,9>; 2,<2,2,3,4>; 3,<3,2,3,4>>   
				   
			List<IntelligentFixingsCategory> categoryList = categoryDao.findCategory("");
			Map<String,List<IntelligentFixingsCategory>> categoryMap = new HashMap<String, List<IntelligentFixingsCategory>>();
			for(IntelligentFixingsCategory category : categoryList){
				String smartId = category.getIntelligentFixingsId();
				List<IntelligentFixingsCategory> categoryList_ = new ArrayList<IntelligentFixingsCategory>();
				if(!categoryMap.containsKey(smartId)){
					categoryList_.add(category);
					categoryMap.put(smartId,categoryList_);
				}else{
					
				}
			}*/
			
		}


		/**
		 * @author YIn
		 * @time:2016年1月7日 下午3:10:02
		 */
		public int update(IntelligentFixingsDto dto) {
			IntelligentFixings record = BeanUtils.createBeanByTarget(dto, IntelligentFixings.class);
			return intelligentFixingsDao.updateIntelligentFixings(record);
			//return intelligentFixingsDao.updateByPrimaryKeySelective(record);
		}


		  @CacheEvict(value = "default", key ="'cookbook.manager.dto.IntelligentFixingsDtoList'", beforeInvocation = true)
        public void deleteIntelligent(FixingsResultDto fdto)
        {
            intelligentFixingsDao.deleteIntelligent(fdto);
            
        }
}

