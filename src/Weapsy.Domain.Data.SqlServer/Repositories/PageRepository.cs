﻿using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Weapsy.Domain.Model.Pages;
using PageDbEntity = Weapsy.Domain.Data.SqlServer.Entities.Page;
using PageLocalisationDbEntity = Weapsy.Domain.Data.SqlServer.Entities.PageLocalisation;
using PageModuleDbEntity = Weapsy.Domain.Data.SqlServer.Entities.PageModule;
using PageModuleLocalisationDbEntity = Weapsy.Domain.Data.SqlServer.Entities.PageModuleLocalisation;
using PagePermissionDbEntity = Weapsy.Domain.Data.SqlServer.Entities.PagePermission;
using PageModulePermissionDbEntity = Weapsy.Domain.Data.SqlServer.Entities.PageModulePermission;

namespace Weapsy.Domain.Data.SqlServer.Repositories
{
    public class PageRepository : IPageRepository
    {
        private readonly WeapsyDbContext _context;
        private readonly DbSet<PageDbEntity> _pages;
        private readonly DbSet<PageLocalisationDbEntity> _pageLocalisations;
        private readonly DbSet<PageModuleDbEntity> _pageModules;
        private readonly DbSet<PageModuleLocalisationDbEntity> _pageModuleLocalisations;
        private readonly DbSet<PagePermissionDbEntity> _pagePermissions;
        private readonly DbSet<PageModulePermissionDbEntity> _pageModulePermissions;
        private readonly IMapper _mapper;

        public PageRepository(WeapsyDbContext context, IMapper mapper)
        {
            _context = context;
            _pages = context.Set<PageDbEntity>();
            _pageLocalisations = context.Set<PageLocalisationDbEntity>();
            _pageModules = context.Set<PageModuleDbEntity>();
            _pageModuleLocalisations = context.Set<PageModuleLocalisationDbEntity>();
            _pagePermissions = context.Set<PagePermissionDbEntity>();
            _pageModulePermissions = context.Set<PageModulePermissionDbEntity>();
            _mapper = mapper;
        }

        public Page GetById(Guid id)
        {
            var dbEntity = _pages
                .Include(x => x.PageLocalisations)
                .Include(x => x.PagePermissions)
                .FirstOrDefault(x => x.Id == id);

            LoadPageModules(dbEntity);

            return dbEntity != null ? _mapper.Map<Page>(dbEntity) : null;
        }

        public Page GetById(Guid siteId, Guid id)
        {
            var dbEntity = _pages
                .Include(x => x.PageLocalisations)
                .Include(x => x.PagePermissions)
                .FirstOrDefault(x => x.SiteId == siteId &&  x.Id == id);

            LoadPageModules(dbEntity);

            return dbEntity != null ? _mapper.Map<Page>(dbEntity) : null;
        }

        public Page GetByName(Guid siteId, string name)
        {
            var dbEntity = _pages
                .Include(x => x.PageLocalisations)
                .Include(x => x.PagePermissions)
                .FirstOrDefault(x => x.SiteId == siteId && x.Name == name);

            LoadPageModules(dbEntity);

            return dbEntity != null ? _mapper.Map<Page>(dbEntity) : null;
        }

        public Page GetByUrl(Guid siteId, string url)
        {
            var dbEntity = _pages
                .Include(x => x.PageLocalisations)
                .Include(x => x.PagePermissions)
                .FirstOrDefault(x => x.SiteId == siteId && x.Url == url);
            LoadPageModules(dbEntity);
            return dbEntity != null ? _mapper.Map<Page>(dbEntity) : null;
        }

        public ICollection<Page> GetAll(Guid siteId)
        {
            var dbEntities = _pages
                .Include(x => x.PageLocalisations)
                .Include(x => x.PagePermissions)
                .Where(x => x.SiteId == siteId).OrderBy(x => x.Name).ToList();

            foreach (var dbEntity in dbEntities)
                LoadPageModules(dbEntity);

            return _mapper.Map<ICollection<Page>>(dbEntities);
        }

        public void Create(Page page)
        {
            var pageDbEntity = _mapper.Map<PageDbEntity>(page);
            _pages.Add(pageDbEntity);
            _context.SaveChanges();
        }

        public void Update(Page page)
        {
            var pageDbEntity = _pages.FirstOrDefault(x => x.Id == page.Id);

            //pageDbEntity = _mapper.Map(page, pageDbEntity);
            pageDbEntity.EndDate = page.EndDate;
            pageDbEntity.Title = page.Title;
            pageDbEntity.MetaDescription = page.MetaDescription;
            pageDbEntity.MetaKeywords = page.MetaKeywords;
            pageDbEntity.Name = page.Name;
            pageDbEntity.Status = page.Status;
            pageDbEntity.SiteId = page.SiteId;
            pageDbEntity.StartDate = page.StartDate;
            pageDbEntity.Url = page.Url;

            UpdatePageLocalisations(page.PageLocalisations);
            UpdatePageModules(page.PageModules);
            UpdatePagePermissions(page.Id, page.PagePermissions);

            _context.SaveChanges();
        }

        private void UpdatePageLocalisations(IEnumerable<PageLocalisation> pageLocalisations)
        {
            //foreach (var item in _pageLocalisations.Where(x => x.PageId == page.Id))
            //{
            //    if (page.PageLocalisations.FirstOrDefault(x => x.LanguageId == item.LanguageId) == null)
            //    {
            //        _pageLocalisations.Remove(item);
            //    }
            //}

            foreach (var pageLocalisation in pageLocalisations)
            {
                var pageLocalisationDbEntity = _pageLocalisations
                    .FirstOrDefault(x =>
                        x.PageId == pageLocalisation.PageId &&
                        x.LanguageId == pageLocalisation.LanguageId);

                if (pageLocalisationDbEntity == null)
                {
                    _pageLocalisations.Add(_mapper.Map<PageLocalisationDbEntity>(pageLocalisation));
                }
                else
                {
                    //pageLocalisationDbEntity = _mapper.Map(pageLocalisation, pageLocalisationDbEntity);
                    pageLocalisationDbEntity.Title = pageLocalisation.Title;
                    pageLocalisationDbEntity.MetaDescription = pageLocalisation.MetaDescription;
                    pageLocalisationDbEntity.MetaKeywords = pageLocalisation.MetaKeywords;
                    pageLocalisationDbEntity.PageId = pageLocalisation.PageId;
                    pageLocalisationDbEntity.Url = pageLocalisation.Url;
                }
            }
        }

        private void UpdatePageModules(IEnumerable<PageModule> pageModules)
        {
            foreach (var pageModule in pageModules)
            {
                var pageModuleDbEntity = _pageModules
                    .FirstOrDefault(x =>
                        x.ModuleId == pageModule.ModuleId &&
                        x.PageId == pageModule.PageId);

                if (pageModuleDbEntity == null)
                {
                    _pageModules.Add(_mapper.Map<PageModuleDbEntity>(pageModule));
                }
                else
                {
                    //pageModuleDbEntity = _mapper.Map(pageModule, pageModuleDbEntity);
                    pageModuleDbEntity.Id = pageModule.Id;
                    pageModuleDbEntity.InheritPermissions = pageModule.InheritPermissions;
                    pageModuleDbEntity.ModuleId = pageModule.ModuleId;
                    pageModuleDbEntity.PageId = pageModule.PageId;
                    pageModuleDbEntity.Status = pageModule.Status;
                    pageModuleDbEntity.SortOrder = pageModule.SortOrder;
                    pageModuleDbEntity.Title = pageModule.Title;
                    pageModuleDbEntity.Zone = pageModule.Zone;

                    UpdatePageModuleLocalisations(pageModule.PageModuleLocalisations);
                    UpdatePageModulePermissions(pageModule.Id, pageModule.PageModulePermissions);
                }
            }
        }

        private void UpdatePageModuleLocalisations(IEnumerable<PageModuleLocalisation> pageModuleLocalisations)
        {
            foreach (var pageModuleLocalisation in pageModuleLocalisations)
            {
                var pageModuleLocalisationDbEntity = _pageModuleLocalisations
                    .FirstOrDefault(x =>
                        x.PageModuleId == pageModuleLocalisation.PageModuleId &&
                        x.LanguageId == pageModuleLocalisation.LanguageId);

                if (pageModuleLocalisationDbEntity == null)
                {
                    _pageModuleLocalisations.Add(_mapper.Map<PageModuleLocalisationDbEntity>(pageModuleLocalisation));
                }
                else
                {
                    //pageModuleLocalisationDbEntity = _mapper.Map(pageModuleLocalisation, pageModuleLocalisationDbEntity);
                    pageModuleLocalisationDbEntity.LanguageId = pageModuleLocalisation.LanguageId;
                    pageModuleLocalisationDbEntity.PageModuleId = pageModuleLocalisation.PageModuleId;
                    pageModuleLocalisationDbEntity.Title = pageModuleLocalisation.Title;
                }
            }
        }

        private void UpdatePageModulePermissions(Guid pageModuleId, IEnumerable<PageModulePermission> pageModulePermissions)
        {
            var existingPageModulePermissionDbEntities = _pageModulePermissions.Where(x => x.PageModuleId == pageModuleId).ToList();

            foreach (var pageModulePermissionDbEntity in existingPageModulePermissionDbEntities)
            {
                var pageModulePermission = pageModulePermissions
                    .FirstOrDefault(x => x.PageModuleId == pageModulePermissionDbEntity.PageModuleId
                    && x.RoleId == pageModulePermissionDbEntity.RoleId
                    && x.Type == pageModulePermissionDbEntity.Type);

                if (pageModulePermission == null)
                    _pageModulePermissions.Remove(pageModulePermissionDbEntity);
            }

            foreach (var pageModulePermission in pageModulePermissions)
            {
                var existingPageModulePermissionDbEntity = existingPageModulePermissionDbEntities
                    .FirstOrDefault(x => x.PageModuleId == pageModulePermission.PageModuleId
                    && x.RoleId == pageModulePermission.RoleId
                    && x.Type == pageModulePermission.Type);

                if (existingPageModulePermissionDbEntity == null)
                    _pageModulePermissions.Add(_mapper.Map<PageModulePermissionDbEntity>(pageModulePermission));
            }
        }

        private void UpdatePagePermissions(Guid pageId, IEnumerable<PagePermission> pagePermissions)
        {
            var existingPagePermissionDbEntities = _pagePermissions.Where(x => x.PageId == pageId).ToList();

            foreach (var pagePermissionDbEntity in existingPagePermissionDbEntities)
            {
                var pagePermission = pagePermissions
                    .FirstOrDefault(x => x.PageId == pagePermissionDbEntity.PageId 
                    && x.RoleId == pagePermissionDbEntity.RoleId 
                    && x.Type == pagePermissionDbEntity.Type);

                if (pagePermission == null)
                    _pagePermissions.Remove(pagePermissionDbEntity);
            }

            foreach (var pagePermission in pagePermissions)
            {
                var existingPagePermissionDbEntity = existingPagePermissionDbEntities
                    .FirstOrDefault(x => x.PageId == pagePermission.PageId 
                    && x.RoleId == pagePermission.RoleId
                    && x.Type == pagePermission.Type);

                if (existingPagePermissionDbEntity == null)
                    _pagePermissions.Add(_mapper.Map<PagePermissionDbEntity>(pagePermission));
            }
        }

        private void LoadPageModules(PageDbEntity pageDbEntity)
        {
            if (pageDbEntity != null)
            {
                pageDbEntity.PageModules = _pageModules
                    .Include(y => y.PageModuleLocalisations)
                    .Include(y => y.PageModulePermissions)
                    .Where(x => x.PageId == pageDbEntity.Id && x.Status != PageModuleStatus.Deleted)
                    .ToList();
            }
        }
    }
}