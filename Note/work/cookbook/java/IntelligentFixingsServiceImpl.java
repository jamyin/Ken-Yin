package com.ssic.cookbook.manager.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssic.cookbook.manager.dao.CategoryDao;
import com.ssic.cookbook.manager.dao.ColorDao;
import com.ssic.cookbook.manager.dao.CuisineDao;
import com.ssic.cookbook.manager.dao.FixingsMasterDao;
import com.ssic.cookbook.manager.dao.IntelligentFixingsDao;
import com.ssic.cookbook.manager.dao.ShapeDao;
import com.ssic.cookbook.manager.dao.SmartNutritionDao;
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
import com.ssic.cookbook.manager.service.IIntelligentFixingsService;
import com.ssic.cookbook.manager.util.BeanUtils;
@Service
public class IntelligentFixingsServiceImpl implements IIntelligentFixingsService
{       
        @Autowired
        private IntelligentFixingsDao intelligentFixingsDao;
        
        @Autowired
        private FixingsMasterDao fixingsMasterDao;
        
        @Autowired
        private SmartNutritionDao smartNutritionDao;
        
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

        public List<FixingsResultDto> findAllIntelligentProduct(FixingsResultDto fdto)
        {
            // TODO 添加方法注释
            List<FixingsResultDto> list=   intelligentFixingsDao.findAllIntelligentProduct(fdto);
            if(list==null){
                return list;
            }
            return list;
        }

        

        public List<FixingsResultDto> findAllIntelligentProductType()
        {
            // TODO 添加方法注释
            return intelligentFixingsDao.findAllIntelligentProductType();
        }

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
		public int addSmart(IntelligentFixingsDto dto) {
        	//配菜主表插数据
        	FixingsMasterDto masterdto = new FixingsMasterDto();
        	masterdto.setId(UUID.randomUUID()+"");
        	masterdto.setFixingsName(dto.getFixingsName());
        	masterdto.setFixingsType(2); //智能配菜
        	boolean masterFlag = fixingsMasterDao.add(masterdto);
        	if(masterFlag != true){
        		return 0;
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
        		return 0;
        	}
			
        	//向智能配菜类别关系表插数据
        	for(int i=0;i<dto.getCategoryId().length;i++){
        		CategoryDto c = new CategoryDto();
        		c.setIntelligentFixingsId(dto.getId());
        		c.setCategoryId(dto.getCategoryId()[i]);
        		c.setCategoryCount(Long.parseLong(dto.getCategoryCount()[i]));
        		boolean stat = categoryDao.add(c);
        		if(stat == false){
        			return 0;
        			
        		}
        	}
        	
        	//向智能配菜菜系关系表插数据
        	for(int i=0;i<dto.getStyleId().length;i++){
        		StyleDto s = new StyleDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setStyleId(dto.getStyleId()[i]);
        		boolean stat = styleDao.add(s);
        		if(stat == false){
        			return 0;
        			
        		}
        	}
             
        	//向智能配菜形状关系表插数据
        	for(int i=0;i<dto.getShapeId().length;i++){
        		ShapeDto s = new ShapeDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setShapeId(dto.getShapeId()[i]);
        		boolean stat = shapeDao.add(s);
        		if(stat == false){
        			return 0;
        			
        		}
        	}
        	
        	//向智能配菜口味关系表插数据
        	for(int i=0;i<dto.getTasteId().length;i++){
        		TasteDto s = new TasteDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setTasteId(dto.getTasteId()[i]);
        		boolean stat = tasteDao.add(s);
        		if(stat == false){
        			return 0;
        			
        		}
        	}
        	
        	//向智能配菜烹饪关系表插数据
        	for(int i=0;i<dto.getCuisineId().length;i++){
        		CuisineDto s = new CuisineDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setCuisineId(dto.getCuisineId()[i]);
        		boolean stat = cuisineDao.add(s);
        		if(stat == false){
        			return 0;
        			
        		}
        	}
        	
        	//向智能配菜颜色关系表插数据
        	for(int i=0;i<dto.getColorId().length;i++){
        		ColorDto s = new ColorDto();
        		s.setIntelligentFixingsId(dto.getId());
        		s.setColorId(dto.getColorId()[i]);
        		boolean stat = colorDao.add(s);
        		if(stat == false){
        			return 0;
        			
        		}
        	}
        	
        	//向智能配菜营养关系表插数据
        	for(int i=0;i<dto.getNutritionId().length;i++){
        		SmartNutritionDto n = new SmartNutritionDto();
        		n.setIntelligentFixingsId(dto.getId());
        		n.setNutritionId(dto.getNutritionId()[i]);
        		n.setNutritionContent(Long.parseLong(dto.getNutritionContent()[i]));
        		n.setNutritionOperator(dto.getNutritionOperator()[i]);
        		boolean stat = smartNutritionDao.add(n);
        		if(stat == false){
        			return 0;
        			
        		}
        	}
        	
			return 1;
		}

        /**
		 * @author YIn
		 * @time:2016年1月4日 上午9:51:19
		 */
		public List<IntelligentFixingsDto> findSmart(IntelligentFixingsDto dto) {
			List<IntelligentFixingsDto> result = intelligentFixingsDao.findSmart(dto);
			return result;
		}
}

